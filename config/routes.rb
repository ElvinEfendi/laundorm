Rails.application.routes.draw do
  root 'dormitories#index'

  resources :dormitories, only: :index do
    resources :machines
  end
end
