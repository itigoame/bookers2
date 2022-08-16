Rails.application.routes.draw do

  get 'users/show'
  get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  resources :books,only: [:new,:index,:show,:edit]
  resources :users,only: [:show,:edit]

end
