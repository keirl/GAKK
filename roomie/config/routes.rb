Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  get 'home/index'
  #root 'home#index'	
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
