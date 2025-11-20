Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  root to: "toppages#index"


  get 'users/registration_complete', to: 'users#registration_complete', as: 'registration_complete'
  
  resources :users, only: [:show, :edit, :update] do
    member do
      patch :update_avatar
      get :edit_social_links
      patch :update_social_links
    end
    resource :like, only: [:create, :destroy]
    resources :user_endorsements, only: [:new, :create]
  end

  resources :likes, only: [:index] do
    collection do
      get :sent
    end
  end
  
  resources :matches, only: [:index, :show] do
    resource :interaction, only: [:create]
  end

  get 'play_models/completion', to: 'play_models#completion', as: 'play_model_completion'
  resources :play_models, only: [:new, :create, :edit, :update]

  get 'hero_proficiencies/completion', to: 'hero_proficiencies#completion', as: 'hero_proficiency_completion'
  resource :hero_proficiency, only: [:edit, :update]
end

