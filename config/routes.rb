IDCD::Application.routes.draw do
  
  resources :proposals do
    collection do
      get :accept
      get :reject
      get :mark_pending
    end
  end

  resources :users do
    collection do
      post :add_faculty
      post :give_admin_status
      post :add_test_user
      post :tester_login
      get :tester_logout
    end
    member do
      get :delete_faculty
      get :remove_admin_status
      get :remove_test_user
    end
  end

  resources :students, :controller => 'users'
  resources :faculties, :controller => 'users'

  resources :proposal_statuses

  resources :group_proposals

  resources :group_members

  resources :proposal_status_types

  resources :proposals do
    member do
      get 'admin_accept'
      get 'admin_reject'

    end
  end

  resources :groups do
    collection do
      post 'add_new_group'
      post 'send_request'
      get 'accept_invite'
      get 'reject_invite'

      get 'leave_group'
      post 'send_invite'
      get 'accept_request'
      get 'reject_request'
    end
  end

  resources :schools

  resources :colleges

  resources :project_statuses

  resources :projects do
    member do
      get 'confirmation'
      get 'complete'
      get 'admin_accept'
      get 'admin_reject'
      get 'faculty_approve'
      get 'faculty_reject'
    end
  end

  resources :companies

  resources :semesters, :path => "/semester_settings/" do
    member do
      post 'add_faculty_to_section'
    end
    resources :sections
  end

  match 'home/login_with_CAS' => 'home#login_with_CAS'
  match 'home/logout' => 'home#logout'
  match 'home' => 'home#index'

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
#  root :to => 'high_voltage/pages#show', :id => 'about'

  root :to =>'projects#new' 

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
