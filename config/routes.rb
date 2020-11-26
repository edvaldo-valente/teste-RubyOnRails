Rails.application.routes.draw do
  root 'commiters#index'

  get 'commiters/index'
end
