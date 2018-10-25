Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  root 'welcome#index'

  get 'home' => 'welcome#index'
  get 'setcard' => 'setcard#show'
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end