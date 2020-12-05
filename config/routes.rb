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
      get '', to: 'games#current'
      delete '', to: 'games#finish'
    end
  end
  resources :categories, only: [:index]
  get '/ranking', to: 'ranking#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  post :auth, to: 'authentication#create'
  get  '/auth' => 'authentication#fetch'
end

# @paths = routes.map {|r| r.defaults.merge(verb: r.verb) }.group_by { |r| r[:controller] }
