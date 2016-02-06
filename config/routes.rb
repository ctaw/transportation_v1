Rails.application.routes.draw do

  root :to => "site/home#index"

  devise_for :users, :path => '', :controllers => { :sessions => 'sessions', registrations: 'registrations' }, :path_names => { :sign_in => 'login', :password => 'forgot', :confirmation => 'confirm', :unlock => 'unblock', :registration => 'register', :sign_up => 'new', :sign_out => 'logout'}
  as :user do
    get 'register', :to => 'devise/registrations#new'
    delete 'logout', :to => 'sessions#destroy'
  end

  namespace :admin do
    resources :dashboard
    resources :places
    namespace :setting_modules do
      resources :type_of_vehicles
      resources :vehicles
      resources :fares
      resources :agencies
      resources :schedules
     end
  end

  namespace :site do
    resources :map
  end

  resources :site do
    get :autocomplete_place_name, :on => :collection
  end

end
