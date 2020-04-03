Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new] 

  resource :session, only: [:new, :create, :destroy]
  resources :poems, only: [:new, :create, :edit, :update, :index]
end