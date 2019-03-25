Rails.application.routes.draw do

  resources :passwords, controller: 'auth/passwords', only: [:create, :new]
  resource :session, controller: 'auth/sessions', only: [:create, :show, :destroy] do
    match '', via: :options, action: 'options'
  end
  resources :users, controller: 'auth/users', only: Clearance.configuration.user_actions do
    resource :password, controller: 'auth/passwords', only: [:create, :update]
  end

  get '/test' => 'test#index', as: 'test_index'

  namespace :core do
    resources :event_categories, only: [:create, :index, :show, :update, :destroy]
    resources :locations, only: [:create, :index, :show, :update, :destroy]  
    resources :events, only: [:create, :index, :show, :update, :destroy]
  end

end
