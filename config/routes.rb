Rails.application.routes.draw do
  resources :tasks do
    collection do
      get 'search'
    end
  end
  root to: 'tasks#index'
end
