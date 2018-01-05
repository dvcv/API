Rails.application.routes.draw do
  get 'item/index'

  get 'lists/index'

  get 'welcome/index'
  namespace :api, defaults: { format: :json } do # expect to receive JSON requests
    resources :users
    resources :lists
    resources :items

  end
  root 'welcome#index'
end
