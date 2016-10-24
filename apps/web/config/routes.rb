get '/activities', to: 'activities#index'
delete '/books/:id', to: 'books#destroy'
patch '/books/:id', to: 'books#update'
get '/books/:id/edit', to: 'books#edit'
get '/books/new', to: 'books#new'
post '/books', to: 'books#create'
get '/books', to: 'books#index'
get '/', to: 'home#index', as: :home

resources :activities, onlly: [:index]
resources :books
