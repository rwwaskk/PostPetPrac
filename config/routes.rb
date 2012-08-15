PostPet::Application.routes.draw do
  resources :albums
  resources :photos
  resources :incomings
  resources :outgoings

  get "album/new"

  get "album/create"

  get "album/update"

  get "album/delete"

  devise_for :users
  authenticated :user do 
  root :to => 'static_pages#home'
  devise_scope :user do
  match 'users/sign_out' =>'devise/sessions#destroy'
  end
  end
  get "box/index"
  get "box/inbox"
  get "box/outbox"
  get "box/unread"
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  get "static_pages/contact"
  get "static_pages/terms"
  get "static_pages/ads"
  get "users/new"
  match '/signup' => 'users#new'
  match '/' => 'static_pages#home'
   
   resources :albums do 
    
     resources :photos
   
    end
     match 'albums/:id/delete'=>'albums#destroy'
     match 'photos/:id/delete'=>'photos#destroy'
     match 'outgoings/:id/delete'=>'outgoings#destroy'
     match 'incomings/:id/delete'=>'incomings#destroy'
     match 'incomings/:id/reply'=>'incomings#reply'
    post 'photos/:id'=>'photos#add_comment'
     post 'outgoings/:id'=>'outgoings#submit_reply'
     post 'incomings/:id'=>'outgoings#submit_reply'
   resources :microposts
   post 'microposts/:id'=>'microposts#add_comment'
   match 'microposts/:id/delete'=>'microposts#destroy'
   resources :microcomments
    match 'microcomments/:id/delete'=>'microcomments#destroy'
    resources :users do
    member do
     get :following, :followers
    end
   end
 
   resources :relationships, :only=>[:create,:destroy]
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
  # match ':controller(/:action(/:id))(.:format)'
end
