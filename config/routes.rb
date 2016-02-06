Rails.application.routes.draw do

  root :to => "site/home#index"

  devise_for :users, :path => '', :controllers => { :sessions => 'sessions', registrations: 'registrations' }, :path_names => { :sign_in => 'login', :password => 'forgot', :confirmation => 'confirm', :unlock => 'unblock', :registration => 'register', :sign_up => 'new', :sign_out => 'logout'}
  as :user do
    get 'register', :to => 'devise/registrations#new'
    delete 'logout', :to => 'sessions#destroy'
  end

  namespace :admin do
    resources :dashboard
    namespace :setting_modules do
      resources :type_of_vehicles
      resources :vehicles
      resources :fares
     end
  end

  namespace :site do
    resources :map
  end

end
