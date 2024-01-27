Rails.application.routes.draw do


  #get 'movies/index'
  #get 'movies/show'
  #get 'movies/edit'
  #get 'movies/look'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :edit, :update]
  resources :movies, only: [:index, :show, :create, :edit, :update, :destroy] do
    get 'look', on: :member
  end
end

