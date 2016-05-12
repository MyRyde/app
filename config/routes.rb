Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :payment_methods
end
