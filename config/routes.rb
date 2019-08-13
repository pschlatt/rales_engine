Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "merchants/:id/items", to: "merchants/items#index"
      get "merchants/:id/items/invoices", to: "merchants/invoices#index"
    end
  end
end
