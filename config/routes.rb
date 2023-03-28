Rails.application.routes.draw do
  root "home#index"

  devise_for :people, controllers: { registrations: "people/registration" }
end
