Rails.application.routes.draw do
  get 'enquiries/create'
  get 'comments/index'
  get 'comments/create'
  get 'comments/destroy'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'members/new'
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
    resources :newswire_posts, only: [:index, :create, :destroy] do
      resources :comments, only: [:destroy, :show, :index]
    end
  end
  
  post 'members/:member_id/newswire_posts/:id/comments', to: 'comments#create'
  #Adding a route for the Account Activations 'edit' action
  resources :account_activations, only: [:edit]
  
  #Adding a resource for password resets
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  resources :programmes, only: [:index, :create, :edit, :update, :destroy, :show]
  
  resources :instructors, only: [:index, :create, :edit, :update, :destroy, :show]
  
  resources :facilities, only: [:index, :create, :edit, :update, :destroy, :show]
  
  resources :testimonials, only: [:index, :create, :edit, :update, :destroy, :show]
  
  resources :lessons, only: [:index, :create, :edit, :update, :destroy, :show]
  
  post '/testimonials', to: 'testimonials#create'
  
  #get 'programmes/boxing', to: 'programmes#boxing'
  #get 'programmes/bjj', to: 'programmes#bjj'
  #get 'programmes/fightingfit', to: 'programmes#fightingfit'
  #get 'programmes/kids', to: 'programmes#kids'
  #get 'programmes/mma', to: 'programmes#mma'
  #get 'programmes/muaythai', to: 'programmes#muaythai'
  #get 'programmes/teens', to: 'programmes#teens'
  #get 'programmes/women', to: 'programmes#women'
  #get 'programmes/wrestling', to: 'programmes#wrestling'
  #get 'programmes/privateclasses', to: 'programmes#privateclasses'
  
  
  #namespace :members do
    #resources :newswire_posts
  #end
  
  #Adding a route for the all newswire posts viewable by all members on the newswire
  get '/newswire', to: 'static_pages#newswire'
  #post '/newswire', to: 'static_pages#create'

  
  
  
end
