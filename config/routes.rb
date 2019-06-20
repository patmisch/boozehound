Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :consumed_drinks
      resources :drinks
      resources :drink_categories
      resources :producers
      resources :purchase_sizes
      resources :drink_types
      root to: "users#index"
    end
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

  resources :drink_types do
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

  resources :consumed_drinks do
    collection do
      get 'purchase_sizes_for_select'
    end

    member do
      get 'follow_up'
      get 'next_day_condition'
      post 'ask_later'
    end
  end

  resources :drink_categories
  resources :users
end
