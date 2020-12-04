Rails.application.routes.draw do
  get '/game', to: 'games#current'

  devise_for :users, controllers: { registrations: 'registrations' }

  post :auth, to: 'authentication#create'
  get  '/auth' => 'authentication#fetch'
end
