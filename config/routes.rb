Rails.application.routes.draw do
resources :users
resources :attractions
resources :sessions
resources :rides

root 'welcome#home'
get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'

end