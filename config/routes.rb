Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registration: 'devise/registrations'
  }

  root 'homes#top'

  get "/home/about" => "homes#about"
  resources :books
  resources :users
end
