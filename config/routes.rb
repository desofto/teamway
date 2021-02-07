Rails.application.routes.draw do
  root to: 'landing#index'
  resources :landing, only: %i[index]

  resources :quizes, only: %i[index create update show] do
    get :progress
  end

  resource :questions do
    get :random
  end
end
