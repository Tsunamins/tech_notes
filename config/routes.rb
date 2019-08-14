Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup' => 'users#new' #current setup needed slash in front, no quotes around signup_path in home/index - signup link
  post '/signup' => 'users#create'
  get '/signin'=> 'sessions#new'
  post '/signin' => 'sessions#create'
  get 'logout' => 'sessions#logout'
  root 'home#index'
  resources :users
end
