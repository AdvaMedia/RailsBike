class UserSessionsController < Devise::SessionsController
  include RailsbikeBase
  
  after_filter :associate_user, :only => :create
  
  # GET /resource/sign_in
  def new
    super
  end
  
  def create
    authenticate_user!

    if user_signed_in?
      respond_to do |format|
        format.html {
          flash[:notice] = I18n.t("logged_in_succesfully")
          redirect_back_or_default(products_path)
        }
        format.js {
          user = resource.record
          render :json => {}.to_json
        }
      end
    else
      flash[:error] = I18n.t("devise.failure.invalid")
      render :new
    end
  end

  def destroy
    session.clear
    super
  end

  def nav_bar
    render :partial => "shared/nav_bar"
  end

  private

  def associate_user
    return unless current_user
    session[:guest_token] = nil
  end

  def accurate_title
    I18n.t(:log_in)
  end
end