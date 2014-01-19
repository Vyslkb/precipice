Precipice::Application.routes.draw do
  
  resources :customer_orders
  
  get 'order_complete', to: 'customer_orders#complete', as: :order_complete
  get 'checkout', to: 'customer_orders#new', as: :checkout



  resources :print_options

  #devise_for :admins
  devise_for :admins, :controllers => {:registrations => "registrations"}
  #devise_for :admins,  :controllers => { :registrations => "admins/registrations" }
  
  
  resources :galleries do
    member do
      get "manage"
    end
  end
  
  resources :collections

  resources :photos do
    collection do
      get "uncategorized"
    end
    member do
      get "show_full_size"
    end
  end
  
 
    
  get 'shopping_cart', to: 'shopping_carts#show'
  post 'update_shopping_cart', to: 'shopping_carts#update'
  
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
