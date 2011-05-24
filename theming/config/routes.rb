Rails.application.routes.draw do
  namespace :admin do
    resources :themes
    match "authenticate" => "authenticate#index", :as => :authenticate
  end
end
