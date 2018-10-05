Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/index'
  devise_for :users

  resources :hobbies
  resources :users do
    resources :hobbies, only: [:index, :create, :destroy], controller: :user_hobbies
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
