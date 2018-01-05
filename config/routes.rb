Rails.application.routes.draw do
  get 'welcome/index'
  namespace :api, defaults: { format: :json } do # expect to receive JSON requests
    resources :users 
  end
  root 'welcome#index'
end
