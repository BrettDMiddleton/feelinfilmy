Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as:'rails_admin'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    root to: 'homes#index'
  end

  root to: 'landing_pages#index'

  resources :dashboards, only: [ :index, :edit ]

  resources :homes, only: [ :index, :show ]

  resources :landing_pages, only: [ :index ]
end
