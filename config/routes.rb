Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :motels
      resources :severe_weather_events

      root to: "users#index"
    end
  devise_for :users
  root to: 'home#index'

  get 'sandbox' => 'sandbox#index'
  get 'sandbox/motels' => 'sandbox#motels'
  get 'sandbox/severe_weather_events' => 'sandbox#severe_weather_events'
  get 'sandbox/voucher_applications' => 'sandbox#voucher_applications'
  get 'sandbox/hello_react' => 'sandbox#hello_react'
  get 'sandbox/photo' => 'sandbox#photo'
  get 'sandbox/websockets_react' => 'sandbox#websockets_react'
end
