module RailsbikeBase
    
  module InstanceMethods
    
    def access_forbidden
      render :text => 'Access Forbidden', :layout => true, :status => 401
    end
    
    protected
    
    def default_title
      Railsbike::Config[:site_name]
    end
    
    def accurate_title
      Railsbike::Config[:default_seo_title]
    end
    
    def render_404(exception = nil)
      respond_to do |type|
        type.html { render :status => :not_found, :file    => "#{Rails.root}/public/404.html", :layout => nil}
        type.all  { render :status => :not_found, :nothing => true }
      end
    end
    
    private
    
    def set_user_language
      locale = session[:locale] || Railsbike::Config[:default_locale]
      locale = I18n.default_locale unless locale && I18n.available_locales.include?(locale.to_sym)
      I18n.locale = locale.to_sym
    end
    
    def get_default_layout
      Railsbike::Config[:default_layout] || "application"
    end

    def redirect_back_or_default(default)
      redirect_to(session["user_return_to"] || default)
      session["user_return_to"] = nil
    end
    
    def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
    end
    
  end
  
  def self.included(receiver)
    #receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    receiver.send :helper, 'hook'
    
    receiver.send :before_filter, 'instantiate_controller_and_action_names'
    receiver.send :before_filter, 'set_user_language'
    
    receiver.send :layout, :get_default_layout
  end
end
