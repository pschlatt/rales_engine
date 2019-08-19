Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do



      get "merchants/find", to: "merchants/search#show"
      get "merchants/find_all", to: "merchants/search#index"
      get "merchants/:id/items", to: "merchants/items#index"
      get "merchants/:id/invoices", to: "merchants/invoices#index"
      get "merchants/most_revenue", to: "merchants/most_revenue#show"
      get "merchants/most_items", to: "merchants/most_items#show"
      get "merchants/revenue", to: "merchants/revenue_date#index"
      get "merchants/:id/revenue", to: "merchants/revenue#show"
      get "merchants/:id/favorite_customer", to: "merchants/fave_customer#show"

      resources :merchants, only: [:index, :show]
      resources :items, only: [:index, :show]
    end
  end
end
