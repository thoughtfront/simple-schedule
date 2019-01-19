Rails.application.routes.draw do

  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create, :destroy]
  resources :users, controller: 'clearance/users', only: Clearance.configuration.user_actions do
    resource :password, controller: 'clearance/passwords', only: [:create, :edit, :update]
  end

end
