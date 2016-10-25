get '/', to: 'home#index', as: :home
post '/', to: 'session#new', as: :login

get '/logout', to: 'session#destroy', as: :logout

resources :activities, only: [:index]
resources :books
resources :users, only: [:new, :create, :edit, :update, :destroy]
