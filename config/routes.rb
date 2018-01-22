Rails.application.routes.draw do
  get 'item/index'

  get 'lists/index'

  get 'welcome/index'
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create]
    end

    resources :items, only: [:destroy]
  end

  root 'welcome#index'
end
