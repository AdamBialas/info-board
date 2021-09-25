module ApplicationHelper

def UserForId(user_id)
    if user_id == current_user.id
        "#{current_user.name} #{current_user.lastname}"
    else
        user = User.where("id = ?",user_id).first
        user.nil? ? "no name" : "#{user.name} #{user.lastname}" 
    end
end


end
