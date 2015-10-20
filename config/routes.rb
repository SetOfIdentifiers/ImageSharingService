Prov::Application.routes.draw do

  get "comment/new"
  get "comment/delete"
  get "comment/edit"
  get "comment/view"
  get "user/view"
  get "image/view"
  post "image/delete"
  post "image/new"
  post "image/randomize"
  post "image/rate"
  post "user/register"
  post "user/login"
  post "user/logout"
  post "comment/new"
  
  get "home/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  post 'user/login' => "user#login", as: 'login'
  post 'user/register' => "user#register", as: 'register'
  post 'user/logout' => "user#logout", as: 'logout'
  post 'image/randomize' => "image#randomize", as: 'randomize'
  post 'image/rate' => "image#rate", as: 'rate'
  post 'image/delete' => "image#delete", as: 'delete'
  post 'comment/new' => "comment#new", as: 'new'
  
  get 'image/:id' => 'image#view'
  get 'user/:id' => 'user#view'
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
