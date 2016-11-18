Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  devise_for :users
end
