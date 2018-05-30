Rails.application.routes.draw do
  devise_for :users
  root to: 'landing_page#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: 'home#index'
  end
end
