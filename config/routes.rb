Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :billythoughts, only: [:create, :destroy]

  get 'home/construction'
  root 'home#construction'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete 'logout',   to: 'sessions#destroy'

end
