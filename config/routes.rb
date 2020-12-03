Rails.application.routes.draw do
  root 'todos#index'
  get 'active', to: 'todos#index', as: 'active_todos', scope: 'active'
  get 'completed', to: 'todos#index', as: 'completed_todos', scope: 'completed'
  resources :todos, except: [:index, :new, :edit] do
    collection do
      # ADD something here
      patch 'toggle_all'
      delete 'clear_completed'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
