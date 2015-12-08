Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do 
    match '/events', to: 'events#index', via: [:options] 
    resources :events, only: [:create] 
  end

  resources :registered_applications

  get 'welcome/index'

  get 'welcome/about'

  devise_for :users

  root to: 'welcome#index'


# we namespace we want to keep the api separate from the other routes
# we only want to record new events from the blocmetrics api

  # you alias a path with another one. THEN you ask 
        # for a prelim access to the target server, asking if the cross-domain request will be permitted
        # this uses the HTTP OPTION verb. this verb precedes GET and POST requests (how?) and
        # checks whether the route accepts a cross-origin request



  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

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
