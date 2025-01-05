Rails.application.routes.draw do
  devise_for :users
  
  resources :projects do
    resources :tasks
    resources :project_memberships, path: :members
  end

  resources :tasks, only: [] do
    resources :comments, only: [:create, :update, :destroy]
    resources :time_entries, only: [:create, :update, :destroy]
  end

  # Dashboard as root
  root "dashboard#index"
end
