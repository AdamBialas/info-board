module InfosHelper

    def created_at_format(info)
        info.created_at.strftime("%Y-%m-%d %H:%M:%S") unless info.created_at.blank?
    end
    
    def like_by_user(info,user)
        dd = info.likes.where("user_id= ?",user.id).first        
        return !dd.nil?
    end

    def like_count(info)
        dd = info.likes.select("count() as like_count")
        return dd
    end


end
