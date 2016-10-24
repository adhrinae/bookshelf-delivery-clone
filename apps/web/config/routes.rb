get '/', to: 'home#index', as: :home

delete '/session/:id', to: 'session#destroy'
get '/session', to: 'session#failure'
get '/session/new', to: 'session#new'

resources :activities, only: [:index]
resources :books
resources :users, only: [:new, :create, :edit, :update, :destroy]
