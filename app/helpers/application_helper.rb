module ApplicationHelper
    include Pagy::Frontend

def UserForId(user_id)
    if user_id == current_user.id
        "#{current_user.name} #{current_user.lastname}"
    else
        user = User.where("id = ?",user_id).first
        user.nil? ? "no name" : "#{user.name} #{user.lastname}" 
    end
end


def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
end

end
