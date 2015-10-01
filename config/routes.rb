Rails.application.routes.draw do
  resources :statistics

  root "welcome#index"
end
