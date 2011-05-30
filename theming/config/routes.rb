Rails.application.routes.draw do
  namespace :admin do
    resources :themes, :templates
  end
end
