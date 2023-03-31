Rails.application.routes.draw do
  root "home#index"

  devise_for :people, controllers: { registrations: "people/registration" }

  resources :promotions
  resources :evaluations, only: [:show, :edit, :destroy]
  resources(:exams, only: [:index, :show, :edit, :destroy]) do
    resources :evaluations, only: [:new, :create]
  end
  resources(:courses) do
    resources :exams, only: [:new, :create, :edit]
  end
end
