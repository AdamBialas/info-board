class InfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  # GET /infos or /infos.json
  def index
    @infos = Info.order("created_at DESC").page params[:page]
  end

  def search
    @infos = Info.search(params[:search]).records
    respond_to do |format|
      format.html { render :index }
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
    @infos = Info.where("user_id = ?", current_user.id).order("created_at DESC").page params[:page]
    respond_to do |format|
      format.html { render :index }
    end
  end

  # POST /infos or /infos.json
  def create
    @info = Info.new(info_params)

    respond_to do |format|
      if @info.save
        format.html { redirect_to infos_path, notice: "Info was successfully created." }
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_info
    @info = Info.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def info_params
    params.require(:info).permit(:contents, :user_id)
  end
end
