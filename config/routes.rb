Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about_us'
  get 'static_pages/faq_s'
  get 'static_pages/gym_rules'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
