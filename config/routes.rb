Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items do
   resources :favorites, only:[:create,:destroy]
   resources :orders, only:[:index,:create]
  end
  get 'favorite/:id', to: 'favorites#checked'
  # post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  # delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
end
