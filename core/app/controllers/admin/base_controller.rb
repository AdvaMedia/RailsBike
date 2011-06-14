class Admin::BaseController < InheritedResources::Base
  defaults :route_prefix => 'admin'
  #include RailsbikeBase
  layout "admin"
  
  helper 'admin/navigation'
  
  
  
  protected
  def render_js_for_destroy
      render :partial => "/admin/shared/destroy"
  end
  
  #Index request for JSON needs to pass a CSRF token in order to prevent JSON Hijacking
  def check_json_authenticity
   return unless request.format.js? or request.format.json?
   auth_token = params[request_forgery_protection_token]
   unless (auth_token and form_authenticity_token == auth_token.gsub(' ', '+'))
     raise(ActionController::InvalidAuthenticityToken)
   end
  end
  
  
end