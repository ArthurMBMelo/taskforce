Rails.application.routes.draw do
  resources :tasks
  resources :monthly_totals, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/monthly_totals/:date",
      to: "monthly_totals#show",
      as: "monthly_total_by_date"
end
