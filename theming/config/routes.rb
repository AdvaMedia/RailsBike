Rails.application.routes.draw do
  railsbike_admin RailsbikeConfig.godmode do
    resources :themes, :templates, :css_files
  end
end
