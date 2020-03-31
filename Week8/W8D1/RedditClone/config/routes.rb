Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]

  resources :users do
    resources :subs, only: [:edit]
    resources :posts, only: [:edit, :create]
  end

  resources :subs, except: :destroy do
    resources :posts, only: [:index, :new]
  end
  
  resources :posts, except: [:index, :edit, :create]
end
