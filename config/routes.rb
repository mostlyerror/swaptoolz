Rails.application.routes.draw do
  root to: 'home#index'

  get 'test_photo' => 'home#test_photo'
end
