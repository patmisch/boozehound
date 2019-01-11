Rails.application.routes.draw do
  resources :drink_categories
  devise_for :users

  authenticated :user do 
    root to: "dashboard#index", as: :user_root
  end

  root to: "home#index"
end
