Rails.application.routes.draw do

  get 'subscriptions/index'
  get 'subscriptions/show'
  get 'subscriptions/create'
  get 'subscriptions/new'
  get 'subscriptions/update'
  get 'subscriptions/edit'
  get 'subscriptions/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/about_us', to: 'static_pages#about_us'
  get '/faq_s', to: 'static_pages#faq_s'
  get '/gym_rules', to: 'static_pages#gym_rules'
  get '/contact', to: 'static_pages#contact'
  post '/contact', to: 'enquiries#create'
  get '/sign_up', to: 'members#new'
  get '/log_in', to: 'sessions#new'
  post '/log_in', to: 'sessions#create'
  delete '/log_out', to: 'sessions#destroy'
  
  resources :members do
    
    resources :newswire_posts do
      resources :comments, only: [:destroy, :show, :index]
    end
    
    resources :subscriptions do 
      get '/registrations', to: 'subscriptions#show'
      resources :registrations, only: [:create, :destroy]
    end
    
    resources :orders do
      resources :order_items
      resources :charges
    end
    
    #patch 'orders/:id', to: 'order_items#update'
    get '/private_timetable', to: 'lessons#private_timetable'
    post '/private_timetable', to: 'lessons#search_timetable'
    
  end
  
  post 'members/:member_id/newswire_posts/:id/comments', to: 'comments#create'
  #Adding a route for the Account Activations 'edit' action
  resources :account_activations, only: [:edit]
  
  #Adding a resource for password resets
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  resources :programmes
  
  resources :instructors
  
  resources :facilities
  
  resources :testimonials, only: [:index, :create, :edit, :update, :destroy, :show]
  
  resources :store_items
  
  resources :lessons
  

  #Adding a route for the all newswire posts viewable by all members on the newswire
  get '/newswire', to: 'static_pages#newswire'

  get '/public_timetable', to: 'lessons#public_timetable'
  post '/public_timetable', to: 'lessons#search_timetable'
  
end
