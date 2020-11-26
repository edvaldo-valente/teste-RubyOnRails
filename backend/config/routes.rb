Rails.application.routes.draw do
  get 'commiters/index'
  root 'commiters#index'
end
