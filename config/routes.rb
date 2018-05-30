Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as:'rails_admin'
  devise_for :users
  # root to: 'landing_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: 'homes#index'
  end
  resources :dashboard, :home, :landing_pages
end
