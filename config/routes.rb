Precipice::Application.routes.draw do
  
  resources :site_photos

  resources :additional_contents

  resources :customer_orders
  
  #post '/email_processor' => 'griddler/emails#create'
  
  ### NEED TO FIX THIS
  get 'shopping_cart', to: 'shopping_carts#show'
  post 'update_shopping_cart', to: 'shopping_carts#update'
  resources :shopping_carts, only: [:index, :destroy]
  ###############################
  
  get 'order_complete', to: 'customer_orders#complete', as: :order_complete
  get 'charge_error', to: 'customer_orders#charge_error', as: :charge_error
  get 'checkout', to: 'customer_orders#new', as: :checkout
  get 'order_error', to: 'customer_orders#order_error', as: :order_error


  resources :print_options do
    collection do
      put 'update_order'
    end
  end

  #devise_for :admins
  devise_for :admins, :controllers => {:registrations => "registrations"}
  #devise_for :admins,  :controllers => { :registrations => "admins/registrations" }
  
  
  resources :galleries do
    member do
      get "manage"
    end
  end
  
  resources :collections do
    collection do
      get "edit_display_order"
      put "update_display_order"
    end
  end

  resources :photos do
    collection do
      get "uncategorized"
      get "manage_slideshow"
      put "update_slideshow"
    end
    member do
      get "show_full_size"
    end
  end
  
 # mount using default path
  #mount_griddler
    
  
  
  #get 'checkout', to: 'shopping_carts#checkout'
  #post 'create_charge', to: 'shopping_carts#create_charge'

  #root 'photos#index'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
