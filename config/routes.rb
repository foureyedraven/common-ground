Rails.application.routes.draw do

root 'static_pages#home'
get '/contact', to: 'static_pages#contact'
get '/math', to: 'static_pages#math'
get '/study-guides', to: 'static_pages#studyguides'
get '/long-reads', to: 'static_pages#longreads'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
