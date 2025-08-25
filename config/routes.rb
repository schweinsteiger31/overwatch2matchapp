Rails.application.routes.draw do
  # Deviseのルートを最優先にする
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  # トップページ
  root to: "toppages#index"

  # PlayModelsControllerのeditアクションへのルーティング
  get 'play_models/edit', to: 'play_models#edit', as: 'play_models_edit'
  
  # PlayModelsControllerのupdateアクションへのルーティング（フォームの送信先）
  patch 'play_models/edit', to: 'play_models#update'

  # Usersに関するルート
  resources :users, only: [ :show, :edit, :update ] do
    collection do
      get "search"
    end
  end
  
end
