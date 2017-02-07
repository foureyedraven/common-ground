Rails.application.routes.draw do
  mount Commonsource::Engine, at: '/admin'
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/math', to: 'static_pages#math'
  get '/study-guides', to: 'static_pages#studyguides'
  get '/long-reads', to: 'static_pages#longreads'
  
  get '/blog/:slug', to: 'posts#show'
  get '/blog', to: 'posts#index'
  get 'search', to: 'posts#search', as: :search

  #that /admin is the namespace in app url for the engine
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
