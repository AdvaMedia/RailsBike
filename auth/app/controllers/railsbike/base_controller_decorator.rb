Railsbike::BaseController.class_eval do
  rescue_from CanCan::AccessDenied do |exception|
    return root_path
  end
end