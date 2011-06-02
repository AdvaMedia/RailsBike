Rails.application.routes.draw do
  
  #devise_for :user,
  #           :controllers => { :sessions => 'user_sessions',
  #                             :registrations => 'user_registrations',
  #                             :passwords => "user_passwords" },
  #           :skip => [:unlocks, :omniauth_callbacks],
  #           :path_names => { :sign_out => 'logout'}
  #resources :users, :only => [:edit, :update]

  #devise_scope :user do
  #  get "/login" => "user_sessions#new", :as => :login
  #  get "/signup" => "user_registrations#new", :as => :signup
  #end
  devise_for :user, :controllers => { :omniauth_callbacks => "omniauth" }
  devise_scope :user do 
    # Fix for any globbaling
    match "/user/auth/:provider" => "omniauth#passthru"
  end
  
  resource :session do
    member do
      get :nav_bar
    end
  end
  resource :account, :controller => "users"
  
  railsbike_admin RailsbikeConfig.godmode do
    resources :users, :roles
    match "authenticate" => "authenticate#index", :as => :authenticate
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
