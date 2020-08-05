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

  delete '/artwork_delete' => 'artworks#destroy'
  put '/update' => 'artworks#update'
  post '/create_artwork' => 'artworks#new'
  get '/find_artwork' => 'artworks#index'

  get 'signup'  => 'users#new'
  get '/edit' =>  'users#edit'
  put '/update_user' => 'users#update'
  get '/login'   => 'sessions#new'
  post '/login'  => 'sessions#create'
  get '/logout'  => 'sessions#destroy'
  put '/change_psw' => 'users#change_psw'
  post '/I_got_forgotten!' => 'users#forgotten_psw'
  delete '/user_delete' => 'users#delete'

  get '/forecast' => 'visit#visit_weather'
  get '/review_create' => 'reviews#new'
  get '/all_reviews' => 'reviews#index'


end
