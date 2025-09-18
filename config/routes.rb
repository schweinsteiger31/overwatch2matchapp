Rails.application.routes.draw do
  get "matches/index"
  get "likes/create"
  get "likes/destroy"
  get "hero_proficiencies/edit"
  get "hero_proficiencies/update"
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

    resource :like, only: [:create, :destroy]
  end

  resources :likes, only: [:index]

  resources :matches, only: [:index, :show] 

  resources :play_models, only: [:new, :create, :edit, :update]
  #プレイモデルの登録後に飛ばすページ
  get 'play_models/completion', to: 'play_models#completion', as: 'play_model_completion'
  
  # ヒーロー習熟度
  resource :hero_proficiency, only: [:edit, :update]

  get 'hero_proficiencies/completion', to: 'hero_proficiencies#completion', as: 'hero_proficiency_completion'
  
  
end
