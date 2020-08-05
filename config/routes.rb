Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" , :omniauth_callbacks => 'omniauth_callbacks'}
  
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artworks do
    resources :reviews  #nested resource
  end
  resources :visit
  resources :users

  put '/artwork_mark_update' => 'artworks#update_mark'
  get '/artwork_more_infos'  => 'artworks#more_infos'
  post '/contact_us_email'   => 'mail#send_email'
  post '/create_artwork' => 'artworks#new'
  put '/update' => 'artworks#update'
  delete '/artwork_delete' => 'artworks#destroy'
  get '/find_artwork' => 'artworks#index'

  get '/forecast' => 'visit#visit_weather'

  get '/review_create' => 'reviews#new'
  get '/all_reviews' => 'reviews#index'
  
end
