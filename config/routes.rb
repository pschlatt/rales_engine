Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "merchants/:id/items", to: "merchants/items#index"
      get "merchants/:id/invoices", to: "merchants/invoices#index"
      get "merchants/most_revenue", to: "merchants/most_revenue#show"
      get "merchants/most_items", to: "merchants/most_items#show"
    end
  end
end
