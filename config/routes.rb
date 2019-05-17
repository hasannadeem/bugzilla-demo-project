Rails.application.routes.draw do
  
  root to: "home#index"

  devise_for :users
  
  resources :projects do
    member do
      patch 'add_user'
      patch 'remove_user'
    end
  end


  
  resources :bugs do
  	member do
    	patch 'assign'
      patch 'start_working'
      patch 'work_done'
  	end
  end

  # resources :project_users, only: [:create, :destroy]

end