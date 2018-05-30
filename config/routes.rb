Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: 'home#index'
  end
<<<<<<< HEAD
  root to: 'landing_page#index'
=======

  # if current_user?
  #   root to: 'home#index'
  # else
  #   root to: 'landing_page#index'
  # end
>>>>>>> parent of 6c55f57... commented out avatar pics
end
