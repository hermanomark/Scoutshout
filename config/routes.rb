Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }

  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get 'home' => 'welcome#index'

  resources :setcard, only: [:show]
  resources :images

  get 'find_model' => 'setcard#find_model'
  get 'search_models' => 'setcard#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end