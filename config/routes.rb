PostPet::Application.routes.draw do
	
	
	
  resources :posts

  resources :topics

  resources :forums

	#hacks
	
	#root page
	root :to => 'static_pages#home'
	
	#part
	
	resources :events do 
       resources :photos
	end
	
	#feed
	match 'users/:id/feed'=>'users#feed'
 	
 	#notify
	post 'pusher/auth'
	
	
	#like
	resources :likes
  
  
    #messages 
  	resources :messages
  	get 'messages/:id/reply'=>'messages#reply'
  	
  	#notification
  	resources :notifications
  	
  	#chat 
  	match '/chat_notify'=>'chat#notify'
	post 'chat'=>'chat#post'
 	get 'chat'=>'chat#index'
 	

    #sessions
	get  '/login' => 'sessions#new', :as => :login
	post '/login' => 'sessions#create', :as => :login
	get "sessions/new"
	get "sessions/create"

  
  
    #alums
  	resources :albums do 
       resources :photos
    end
    
    #forums
    resources :forums do 
    	resources :topics do
    		resources :posts 
    	end
    end
	
	resources :photos
  	get "album/new"
	get "album/create"
	get "album/update"
	get "album/delete"
	match 'albums/:id/delete'=>'albums#destroy'
    match 'photos/:id/delete'=>'photos#destroy'
    post 'photos/:id'=>'photos#add_comment'
  	
  
 	
  
	#devise for users
	devise_for :users
	authenticated :user do 
  		devise_scope :user do
  			match 'users/sign_out' =>'devise/sessions#destroy'
  		end
	end
	
	
	#microcomments 
	match 'microcomments/:id/delete'=>'microcomments#destroy'
	  	
    resources :users do
		member do
	  		get :following, :followers
	  	end
	end
 
  #static pages
	get "static_pages/home"
  	get "static_pages/help"
  	get "static_pages/about"
  	get "static_pages/contact"
  	get "static_pages/terms"
  	get "static_pages/ads"
  	get "static_pages/development"
  
  #microposts
  	resources :microposts do
      member do
        post:notify_friend
      end
    end
    
   #relationships 
   resources :relationships, :only=>[:create,:destroy]
   get "users/new"
   match '/signup' => 'users#new'
  
   
   resources :microposts do
      member do
        post:notify_friend
      end
    end
   
   post 'microposts/:id'=>'microposts#add_comment'
   match 'microposts/:id/delete'=>'microposts#destroy'
   resources :microcomments
   match 'microcomments/:id/delete'=>'microcomments#destroy'
    
    
    
   
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
