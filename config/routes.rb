Rails.application.routes.draw do
  resources :stars
  get 'manage_panel/index'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bicycles, :categories

  resources :bicycles do
    put :favorite, on: :member
  end

  get '/manage_panel' => 'manage_panel#index', as: 'manage_panel'
  get '/manage_panel/:id' => 'manage_panel#show'

  match 'star', to: 'stars#star', via: :post
  match 'unstar', to: 'stars#unstar', via: :delete

  root 'bicycles#index'
end
