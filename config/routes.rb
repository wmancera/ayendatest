Rails.application.routes.draw do
  resources :albumms
  resources :albumarts
  resources :albumsarts
  resources :albuns
  resources :songs
  resources :albums
  resources :artists
    #namespace :api do |variable|
     namespace :api, defaults: {format: 'json'} do
        namespace :v1 do
          resources :artists    
        end 
     end 

  get '/api/v1/artists/:id/albums', to: 'albumms#show'   

  get '/error', to: 'error#show' 
end
