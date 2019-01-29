Rails.application.routes.draw do
  devise_for :users

  authenticated :user do 
    root to: "dashboard#index", as: :user_root
  end

  root to: "home#index"


  resources :producers do
    collection do
      get 'search'
    end
  end

  resources :drinks do
    collection do
      get 'type_selected'
      get 'search'
    end
  end

  resources :consumed_drinks
  resources :drink_categories
end
