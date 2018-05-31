Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as:'rails_admin'
  devise_for :users
  root to: 'movies#index'
  get 'movie_tags/create'
  get 'user_movies/create'
  get 'user_movies/update'
  get 'movies/index'
  get 'movies/show'
  get 'pages/landing'
  get 'pages/dashboard'
end
