FactoryBot.define do
  factory :item do
    name { "Banana Stand" }
    description { "There's always money in the banana stand." }
    unit_price { 500 }
    merchant_id { 1 }
  end
end
