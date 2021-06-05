Rails.application.routes.draw do
  get 'tops/index'
  root "tops#index"

  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :games do
    resources :comments
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#guest'
    get 'users/favorites', to: 'users/registrations#favorites_index'
  end

  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
  
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
