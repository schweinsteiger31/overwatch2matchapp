Rails.application.routes.draw do
  # Deviseのルートを最優先にする
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  # トップページ
  root to: "toppages#index"

  resources :users, only: [ :show, :edit, :update ] do
    collection do
      get "search"
    end
  end

  get 'users/registration_complete', to: 'users#registration_complete', as: 'registration_complete'
  
end
