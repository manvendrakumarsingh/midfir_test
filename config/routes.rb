Rails.application.routes.draw do
  devise_for :users

  post "user/login"=>"sessions#login",as: "user_login"
  post "registration"=>"sessions#registration",as: "sign_up"
  get "user/dashboard"=>"users#dashboard",as: "dashboard"
  get "logout"=>"sessions#logout",as: "logout"
  get "artist/profile/:id"=>"users#profile_details",as: "artist_profile"
  resources :paintings
  resources :users
  root 'home#welcome'
  match '*path' => redirect('/404.html'), via: :get
end
