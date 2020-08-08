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

  # artworks:
  put '/artwork_mark_update' => 'artworks#update_mark'
  post '/create_artwork_admin' => 'artworks#new_artwork_admin'
  post '/create_artwork_lover' => 'artworks#new_artwork_lover'
  get '/artwork_more_infos'  => 'artworks#more_infos'
  put '/update' => 'artworks#update'
  delete '/artwork_delete' => 'artworks#destroy'
  get '/find_artwork' => 'artworks#index'

  # reviews:
  get '/review_create' => 'reviews#new'
  get '/all_reviews' => 'reviews#index'

  # other:
  post '/contact_us_email'   => 'mail#send_email'
  get '/forecast' => 'visit#visit_weather'

  
end
