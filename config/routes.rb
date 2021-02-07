Rails.application.routes.draw do
  resources :landing, only: %i[index]
  resources :questions, only: %i[index]
  resources :quizes, only: %i[index create]
  root to: 'landing#index'
end
