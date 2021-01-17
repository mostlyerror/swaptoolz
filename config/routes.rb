Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get 'sandbox' => 'sandbox#index'
  get 'sandbox/hello_react' => 'sandbox#hello_react'
  get 'sandbox/photo' => 'sandbox#photo'
end
