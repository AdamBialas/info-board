class InfoLike < ApplicationRecord
  belongs_to :info
  belongs_to :user, foreign_key: "user_id"

  def self.new_like(info,user)
    self.create(:user_id => user.id, :info_id => info.id)
  end

  def self.del_like(info,user)
    dd = InfoLike.where("user_id= ? and info_id=?",user.id,info.id).first
    dd.destroy unless dd.nil? 
  end

end
