Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get 'test_photo' => 'home#test_photo'
end
