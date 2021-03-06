Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations/registrations" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # route for surveys
  # each user gets their own survey
  resource :childcare_survey, only: [:new, :create, :show]
  resource :petcare_survey,   only: [:new, :create, :show]
  resource :tutoring_survey,  only: [:new, :create, :show]
  resource :handyman_survey,  only: [:new, :create, :show]

  # RESTful routes for users
  resources :users do
    member do
        get :accepted_jobs,             to: "users#accepted_jobs"
        get :completed_jobs,            to: "users#completed_jobs"
        get :calculate_accepted_jobs,   to: "users#calculate_accepted_jobs"
        get :calculate_completed_jobs,  to: "users#calculate_completed_jobs"
        get :contacts,                  to: "users#contacts"
        post :add_contact,              to: "users#add_contact"
        post :remove_contact,           to: "users#remove_contact"
    end
  end
  resources :profiles, only: [:show, :edit] do
    member do
      post :mark_availability,    to: "profiles#mark_availability"
      post :submit_availability,  to: "profiles#submit_availability"
      post :clear_availability,   to: "profiles#clear_availability"
      post :about_me,             to: "profiles#about_me"
      post :avatar,               to: "profiles#avatar"
    end
  end

  resources :jobs do
    member do
      post :create_offer, to: "jobs#create_offer"
      post :accept,       to: "jobs#accept_job"
      post :reject,       to: "jobs#reject_job"
      post :complete,     to: "jobs#complete_job"
    end
    collection do
      post :search
    end
  end

  resources :offers, only: [:index]
  resources :references

  # for when users make offers on jobs
  resource  :hard_offers, only: [:create, :show]
  resources :comments,    only: [:new, :create]


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
