Rails.application.routes.draw do
  get 'item/index'

  get 'lists/index'

  get 'welcome/index'
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [:update] do
      resources :items, only: [:update]
    end
    resources :lists, only: [:index]
    resources :items, only: [:index, :update, :destroy]
  end

  root 'welcome#index'
end
