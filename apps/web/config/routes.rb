get '/', to: 'home#index', as: :home
post '/', to: 'session#new', as: :login

delete '/logout/:id', to: 'session#destroy'

resources :activities, only: [:index]
resources :books
resources :users, only: [:new, :create, :edit, :update, :destroy]
