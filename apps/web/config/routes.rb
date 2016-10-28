get '/', to: 'home#index', as: :home
post '/', to: 'session#new', as: :login

get '/account_activation/:token/email/:email', to: 'users#activate', as: :activate

get '/logout', to: 'session#destroy', as: :logout

resources :activities, only: [:index]
resources :books
resources :users, only: [:new, :create, :edit, :update, :destroy, :activate]
resources :password_resets, only: [:new, :create, :edit, :update]
