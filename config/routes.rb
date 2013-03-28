Ticketee::Application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}

  root to: 'projects#index' 
  resources :projects do
    resources :tickets
  end

  namespace :admin do
    resources :users
    root to:"base#index"
  end

  get '/awaiting_confirmation', to: 'users#confirmation', as: 'confirm_user'
end
