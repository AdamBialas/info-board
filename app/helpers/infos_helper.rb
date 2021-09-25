module InfosHelper

    def created_at_format(info)
        info.created_at.strftime("%Y-%m-%d %H:%M:%S") unless info.created_at.blank?
    end
    
end
