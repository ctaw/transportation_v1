Rails.application.routes.draw do

  root :to => "site/home#index"
  
  devise_for :user, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

end
