Rails.application.routes.draw do
  resources :problems, only: [] do
    collection do
      get :next
      get :view
      post :answer
    end
  end
  resources :games, only: [] do
    collection do
      get '', to: 'games#current', as: :current
      delete '', to: 'games#finish', as: :finish
    end
  end
  resources :categories, only: [:index]
  get '/ranking', to: 'ranking#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  post :auth, to: 'authentication#create'
  get  '/auth' => 'authentication#fetch'

  root to: 'routes#index'
end

# @paths = routes.map {|r| r.defaults.merge(verb: r.verb) }.group_by { |r| r[:controller] }
