Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artworks
  resources :visit

  put '/artwork_mark_update' => 'artworks#update_mark'
  get '/artwork_more_infos'  => 'artworks#more_infos'
  post '/contact_us_email'   => 'mail#send_email'
end
