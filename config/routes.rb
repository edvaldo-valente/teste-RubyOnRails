Rails.application.routes.draw do
  root 'commiters#index'
  get 'commiters/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
