Assure::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  match '/auth/:provider/callback' => 'authentications#create'
  
  authenticated :user do
    root :to => 'home#index'
  end

  unauthenticated :user do
    root :to => 'home#welcome'
  end

  devise_for :users, :controllers => { :registrations => 'registrations' } do
    get '/users/sign_out' => 'devise/sessions#destroy' # added this becaause of sign_out bug.
    get '/users/sign_in' => 'devise/sessions#new'
  end

  match 'welcome' => 'home#welcome' # just for testing layout
  match '/' => 'home#index', :as => 'home'
  match 'guest' => 'home#guest', :as => 'guest'

  resources :users
  resources :authentications
  resources :profile do
    # get '/:uid' => 'profiles#public', :as => 'public', :constraints => { :uid => /\d+/ }
  end

  namespace :custom_admin do
    resources :users
  end
  
end
