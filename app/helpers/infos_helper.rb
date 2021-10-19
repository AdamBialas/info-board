module InfosHelper

    def created_at_format(info)
        info.created_at.strftime("%Y-%m-%d %H:%M:%S") unless info.created_at.blank?
    end
    
    def like_by_user(info,user)
        dd = InfoLike.where("user_id= ? and info_id=?",user.id,info.id).first        
        return !dd.nil?
    end

    def like_count(info)
        dd = InfoLike.select("count() as like_count").where("info_id=?",info.id)        
        return dd
    end


end
