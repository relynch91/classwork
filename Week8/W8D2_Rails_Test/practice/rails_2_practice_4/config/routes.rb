Rails.application.routes.draw do
  resources :users, only: [:show, :index, :new, :create] do 
    resources :goals, only: [:create]
  end
  resources :goals, only: [:destroy]
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
