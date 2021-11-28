class InfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_info, only: [:show, :edit, :update, :destroy ,:like]

  # GET /infos or /infos.json
  def index
    @pagy, @infos = pagy Info.order("created_at DESC").all

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "infos", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      }
    end

    
  end

  def search
    @pagy, @infos = pagy Info.search(params[:search]).records
    respond_to do |format|
      format.html { render :index }
      format.json {
        render json: { entries: render_to_string(partial: "infos", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      }
    end
  end

  # GET /infos/1 or /infos/1.json
  def show
  end

  # GET /infos/new
  def new
    @info = Info.new
  end

  # GET /infos/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def desk
    @pagy, @infos = pagy  Info.where("user_id = ?", current_user.id).order("created_at DESC")
    respond_to do |format|
      format.html { render :index }
      format.json {
        render json: { entries: render_to_string(partial: "infos", formats: [:html]), pagination: view_context.pagy_nav(@pagy) }
      }
    end
  end

  # POST /infos or /infos.json
  def create
    @info = Info.new(info_params)

    respond_to do |format|
      if @info.save
        format.html { redirect_to infos_path
           flash[:success] = "Info was successfully created." }
        format.json { render :show, status: :created, location: @info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /infos/1 or /infos/1.json
  def update
    respond_to do |format|
      if @info.update(info_params)
        format.html { redirect_to request.referrer, notice: "Info was successfully updated." }
        format.json { render :show, status: :ok, location: @info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infos/1 or /infos/1.json
  def destroy
    @info.destroy
    respond_to do |format|
      format.html { redirect_to infos_url, notice: "Info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    
    respond_to do |format|
      p format
      format.html {}
      format.js {
        ul=@info.like_by_user(current_user)
        if ul.nil?
        @info.likes.add(current_user)
        @action_like=1
        else
        ul.destroy
        @action_like=0
        end
        @like_count=@info.like_count()
        p @like_count
      }
    end
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_info
    @info = Info.find(params[:id]||params[:info_id])
  end

  # Only allow a list of trusted parameters through.
  def info_params
    params.require(:info).permit(:contents,:image_url, :user_id)
  end
end
