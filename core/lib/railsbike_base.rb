module RailsbikeBase
  
  module InstanceMethods
    def set_user_language
      locale = session[:locale] || Railsbike::Config[:default_locale]
      locale = I18n.default_locale unless locale && I18n.available_locales.include?(locale.to_sym)
      I18n.locale = locale.to_sym
    end
  end
  
  def self.included(receiver)
    #receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
    receiver.send :helper, 'hook'
  end
end