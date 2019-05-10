Rails.application.routes.draw do
  
  root to: "home#index"

  devise_for :users
  
  get 'home/manager' ,:as => "manager"
  get 'home/developer' , :as => "developer"
  get 'home/qa' , :as => "qa"
  
  resources :projects 
  resources :bugs do
  	member do
    	get 'assign'
      get 'start_working'
      get 'work_done'
  	end
  end
  resources :project_users, only: [:create, :destroy]

end



# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html