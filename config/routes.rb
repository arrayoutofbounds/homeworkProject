Rails.application.routes.draw do

  # resources :answers
  resources :homeworks 
  resources :users
  resources :sessions

  get 'homeworks/:id/assign' => "homeworks#assign", as: :assign_homework
  patch 'homeworks/:id/assign' => "homeworks#assigned", as: :assigned_homework

  get "log_in" => "sessions#new", as: :log_in

  get "log_out" => "sessions#destroy", as: :log_out

  get "homeworks/:homework_id/answers/new" => "answers#new_answer", as: :new_answer

  post "homeworks/:homework_id/answers" => "answers#create_new_answer", as: :create_new_answer

  get "homeworks/:homework_id/answers" => "answers#show_answers", as: :show_answers
  get "users/:user_id/homeworks/:homework_id/answers" => "answers#show_users_homework_answers", as: :show_users_homework_answers
  


  # get 'user/list'

  # get 'user/show'

  # get 'user/new'

  # get 'user/create'

  # get 'user/edit'

  # get 'user/update'

  # get 'user/delete'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'application#welcome', as: :root

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
