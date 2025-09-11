Rails.application.routes.draw do
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
  #プレイモデルの登録後に飛ばすページ
  get 'play_models/completion', to: 'play_models#completion', as: 'play_model_completion'
  

  resource :partner_condition, only: [:edit, :update]

  
end
