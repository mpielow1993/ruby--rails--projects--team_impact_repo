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
    
    resources :subscriptions, only: [:new, :create, :edit, :update, :destroy, :index, :show] do
      resources :registrations, only: [:create, :destroy, :index]
    end
    
    resources :orders, only: [:show, :index, :destroy] do
      resources :order_items
    end
    
    get '/live_order', to: 'orders#live_order'
    post 'live_order', to: 'orders#create_live_order'
    delete 'live_order', to: 'orders#destroy_live_order'

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
  resources :enquiries, only: [:new, :create] 
  resources :store_items
  
  resources :lessons do
    resources :registrations, only: [:create, :destroy]
  end

  namespace :admin do
    resources :testimonials, only: [:new, :create, :destroy, :index] 
    resources :enquiries, only: [:new, :create, :destroy, :index]
    resources :members
    resources :programmes
    resources :instructors
    resources :facilities

    resources :lessons do
      get '/registrations', to: 'lessons#show'
      resources :registrations, only: [:create, :destroy]
    end
    
    resources :store_items
    
    resources :orders do
      resources :order_items
    end
    resources :account_activations, only: [:new, :create, :edit, :update]
  end

  #Adding a route for the all newswire posts viewable by all members on the newswire
  get '/newswire', to: 'static_pages#newswire'

  get '/public_timetable', to: 'lessons#public_timetable'
  post '/public_timetable', to: 'lessons#search_timetable'
  
end
