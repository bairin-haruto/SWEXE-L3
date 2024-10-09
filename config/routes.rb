Rails.application.routes.draw do
  resources :tweets
  root 'tweets#index'
  get 'profile', to: 'users#show', as: 'profile'
  resources :messages

end
