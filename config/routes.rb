Rails.application.routes.draw do
  resources :promotions

  devise_for :people, controllers: { registrations: "people/registration" }

  root "home#index"
end
