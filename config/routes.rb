Rails.application.routes.draw do
  get 'home/show'
  get 'home/index'
  get 'home/update_tag'
  get 'home/update_watchlist'
  get 'landing_page/create'
  get 'dashboard/edit'
  get 'dashboard/update'
  get 'dashboard/destroy'
  get 'dashboard/friend'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
