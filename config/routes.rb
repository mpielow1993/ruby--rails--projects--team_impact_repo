Rails.application.routes.draw do

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
    
    resources :newswire_posts, only: [:show] do
    end
    
    get '/newswire_posts', to: 'newswire_posts#private_index'
    
    get '/comments', to: 'comments#private_index'
    
    get '/private_timetable', to: 'lessons#private_timetable'
    post '/private_timetable', to: 'lessons#search_timetable'
    
    resources :subscriptions, only: [:new, :create, :edit, :update, :destroy, :index] do
      get '/registrations', to: 'subscriptions#show'
      resources :registrations, only: [:create, :destroy]
    end
    
    resources :orders, only: [:new, :create, :edit, :update, :destroy] do
      resources :order_items
      resources :charges
    end
    
    get 'orders/live', to: 'orders#live_order'
    get 'orders/completed', to: 'orders#completed_orders'
    get 'orders/completed/:id', to: 'orders#completed_order'
    
  end
  
  resources :newswire_posts, path: 'newswire', only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :comments, only: [:new, :create, :edit, :update, :show, :destroy]
  end
  
  get '/newswire', to: 'newswire_posts#public_index'
  
  #Adding a route for the Account Activations 'edit' action
  resources :account_activations, only: [:edit]
  
  #Adding a resource for password resets
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  resources :programmes
  
  resources :instructors
  
  resources :facilities
  
  resources :testimonials, only: [:new, :create, :index] 
  
  namespace :admin do
    resources :testimonials, only: [:new, :create, :destroy, :index] 
  end
  
  resources :enquiries, only: [:new, :create] 
  
  namespace :admin do
    resources :enquiries, only: [:new, :create, :destroy, :index] 
  end
  
  resources :store_items
  
  resources :lessons do
    resources :registrations, only: [:create, :destroy]
  end

  #Adding a route for the all newswire posts viewable by all members on the newswire
  get '/newswire', to: 'static_pages#newswire'

  get '/public_timetable', to: 'lessons#public_timetable'
  post '/public_timetable', to: 'lessons#search_timetable'
  
end
