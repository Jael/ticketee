Ticketee::Application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}

  root to: 'projects#index' 
  resources :projects do
    resources :tickets do
      collection do
        get :search
      end
    end
  end

  resources :tickets do
    resources :comments 
    resources :tags do 
      member do
        delete :remove
      end
    end
  end

  namespace :admin do
    resources :users do
      resources :permissions
    end
      
    resources :states do
      member do
        get :make_default
      end
    end

    root to:"base#index"
  end

  get '/awaiting_confirmation', to: 'users#confirmation', as: 'confirm_user'
  put '/admin/users/:user_id/permissions', to: 'admin/permissions#update', as: :update_user_permissions
  resources :files
end
