Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artworks
  resources :visit
  resources :users

  put '/artwork_mark_update' => 'artworks#update_mark'
  get '/artwork_more_infos'  => 'artworks#more_infos'
  post '/contact_us_email'   => 'mail#send_email'

  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  post 'login'  => 'sessions#create'
  get 'logout'  => 'sessions#destroy'


end
