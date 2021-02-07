Rails.application.routes.draw do
  root to: 'landing#index'
  resource :landing, only: %i[index]

  resource :quizes, only: %i[create] do
    get :index
    get :progress
    get :result
    put :update
  end

  resource :questions do
    get :random
  end
end
