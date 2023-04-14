Rails.application.routes.draw do
  # get "pages#welcome"
  devise_for :users
  resources :tasks
  # resources :monthly_totals, only: [:index]
  resources :monthly_totals do
    resources :tasks
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#welcome"
  get "/tasks", to: "tasks#index"
  get "/monthly_totals/:date",
      to: "monthly_totals#show",
      as: "monthly_total_by_date"
end
