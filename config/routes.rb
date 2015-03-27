Rails.application.routes.draw do
  get 'profile/edit' => "profiles#edit"
  patch 'profile/create' => "profiles#create"

  devise_for :users, :controllers => {:registrations => "users/registrations"}
	
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  root 'categories#index'
end
