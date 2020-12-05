Rails.application.routes.draw do
  resources :problems, only: [] do
    get :next, on: :collection
    get :view, on: :collection
    post :answer, on: :collection
  end
  get '/game', to: 'games#current'
  get '/game/score', to: 'games#score'
  delete '/game', to: 'games#finish'

  devise_for :users, controllers: { registrations: 'registrations' }

  post :auth, to: 'authentication#create'
  get  '/auth' => 'authentication#fetch'
end
