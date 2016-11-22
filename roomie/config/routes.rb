Rails.application.routes.draw do
#  get 'matches/index'

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #resources :profiles 
  devise_for :users
  get 'home/index'
  #root 'home#index'

  resources :users do
    resource :profile
  end

  resources :users do
    resource :preferences
  end

  resources :users do
    resources :matches
  end
	
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
