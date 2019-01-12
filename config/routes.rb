Rails.application.routes.draw do
  resources :consumed_drinks
  resources :drink_categories
  devise_for :users

  authenticated :user do 
    root to: "dashboard#index", as: :user_root
  end

  root to: "home#index"
end
