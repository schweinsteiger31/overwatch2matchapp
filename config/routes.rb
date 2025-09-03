Rails.application.routes.draw do
  get "partner_conditions/edit"
  get "partner_conditions/update"
  # Deviseのルートを最優先にする
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  # トップページ
  root to: "toppages#index"

  #登録ありがとうございますページ
  get 'users/registration_complete', to: 'users#registration_complete', as: 'registration_complete'

  resources :users, only: [ :show, :edit, :update ] do
    collection do
      get "search"
    end
  end

  resources :play_models, only: [:new, :create]

  resource :partner_condition, only: [:edit, :update]
  
end
