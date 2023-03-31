Rails.application.routes.draw do
  root "home#index"

  devise_for :people, controllers: { registrations: "people/registration" }

  resources :promotions
  resources :evaluations
  resources(:exams) {
    resources :evaluations }
  resources(:courses) {
    resources :exams }
end
