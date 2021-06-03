Rails.application.routes.draw do
  root "games#index"
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
  resources :users, only: [:show]
  resources :favorites, only: [:create, :destroy]
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
