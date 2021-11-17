class Info::Like < ApplicationRecord
  belongs_to :info
  belongs_to :user, foreign_key: "user_id"

  def self.add(user)
    p user
    nl = Info::Like.new
    nl.user_id =  user.id
    nl.save!
  end

  def self.del_like(user)
    dd = info.likes.where("user_id= ?",user.id).first
    dd.destroy unless dd.nil? 
  end

end
