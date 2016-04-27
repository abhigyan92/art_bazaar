Rails.application.routes.draw do
  resources :transactions
  get 'customers/new'

  get 'customers/create'

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'=>'carts#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'login/new'
  get 'admin/home'
  root to: "main#index"
  post   'login'   => 'login#create'
  delete 'logout' =>'login#destroy'
  get 'view_order' =>'product#order_details'
  get 'products'=>'product#index'
  get '/mains/:id', to: 'main#show'
  post 'products'=>'product#create'
  resources :product
  resources :mains
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  #resources :orders, only:[:new,:create]
  resources :customers, only:[:new,:create]


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
