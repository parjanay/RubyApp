module ApplicationHelper
    def gravatar_for(user, options = {size: 180})
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size] 
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.name)
    end
    def current_user
        @current_user ||= User.find_by(session[:user_id].to_s) if session[:user_id]
            
    end
    def logged_in?
        !!current_user
    end

end
