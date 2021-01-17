Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get 'tests' => 'tests#index'
  get 'tests/hello_react' => 'tests#hello_react'
  get 'tests/photo' => 'tests#photo'
end
