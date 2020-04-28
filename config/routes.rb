Rails.application.routes.draw do
  get 'welcome/index'
  resources :imports
  resources :topos
  resources :problems

  root 'welcome#index'
end
