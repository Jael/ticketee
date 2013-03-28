Ticketee::Application.routes.draw do
  devise_for :users

  root to: 'projects#index' 
  resources :projects do
    resources :tickets
  end

  namespace :admin do
    resources :users
    root to:"base#index"
  end
end
