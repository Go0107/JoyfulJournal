Rails.application.routes.draw do

  get "journals/chart" => "journals#chart"
  root 'tops#index'
  devise_for :users
  resources :journals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
