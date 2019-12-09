Rails.application.routes.draw do

  namespace :admin do
    get 'members/new'
    get 'members/create'
    get 'members/edit'
    get 'members/update'
    get 'members/index'
    get 'members/show'
    get 'members/destroy'
  end
  get 'completed_orders/new'
  get 'completed_orders/create'
  get 'completed_orders/edit'
  get 'completed_orders/update'
  get 'completed_orders/index'
  get 'completed_orders/show'
  get 'completed_orders/delete'
  get 'live_orders/new'
  get 'live_orders/create'
  get 'live_orders/edit'
  get 'live_orders/update'
  get 'live_orders/index'
  get 'live_orders/show'
  get 'live_orders/delete'
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
    
    namespace :orders do
      resources :live_orders do
        resources :order_items
      end
      
      resources :completed_orders
    end
  end

  resources :charges  

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
    
    resources :enquiries, only: [:new, :create, :destroy, :index]
    
    resources :members
    
    resources :programmes
  
    resources :instructors
  
    resources :facilities
    
    resources :lessons
    
    resources :completed_orders
    
    resources :store_items
  end
  
  resources :enquiries, only: [:new, :create] 
  
  namespace :admin do
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
