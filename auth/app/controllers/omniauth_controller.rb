class OmniauthController < Devise::OmniauthCallbacksController
  # Fix for any globbaling
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  
  def method_missing(provider)
    if !User.omniauth_providers.index(provider).nil?
      #omniauth = request.env["omniauth.auth"]
      omniauth = env["omniauth.auth"]
      if current_user #or User.find_by_email(auth.recursive_find_by_key("email"))
        current_user.user_tokens.find_or_create_by(:provider=>omniauth['provider'], :uid=>omniauth['uid'])
         flash[:notice] = "Authentication successful"
         redirect_to edit_user_registration_path
      else

      authentication = UserToken.where(:provider=>omniauth['provider'], :uid=>omniauth['uid']).first
      
        if authentication
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
          sign_in_and_redirect(:user, authentication.user)
          #sign_in_and_redirect(authentication.user, :event => :authentication)
        else

          #create a new user
          unless omniauth.recursive_find_by_key("email").blank?
            ap "user is finded"
            user = User.find_or_initialize_by(:email => omniauth.recursive_find_by_key("email"))
          else
            ap "only new user"
            user = User.new
          end

          user.apply_omniauth(omniauth)
          #user.confirm! #unless user.email.blank?
          if user.save
            ap "saved"
            flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider'] 
            sign_in_and_redirect(:user, user)
          else
            ap "non_saved"
            session[:omniauth] = omniauth.except('extra')
            redirect_to new_user_registration_url
          end
        end
      end
    end
  end
end