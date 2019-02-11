Rails.application.routes.draw do

  resources :passwords, controller: 'auth/passwords', only: [:create, :new]
  resource :session, controller: 'auth/sessions', only: [:create, :show, :destroy] do
    match '', via: :options, action: 'options'
  end
  resources :users, controller: 'auth/users', only: Clearance.configuration.user_actions do
    resource :password, controller: 'auth/passwords', only: [:create, :update]
  end

  get '/test' => 'test#index', as: 'test_index'

end
