class Merchant < ApplicationRecord
has_many :items
has_many :invoices
has_many :customers, through: :invoices
# Merchant.select("merchants.*").joins(:items).order("unit_price DESC").limit(2)

  def self.most_revenue(quantity)
    select('merchants.*, SUM(invoice_items.quantity * items.unit_price) as total_revenue')
    .joins(items: :invoice_items)
    .group(:id)
    .order('total_revenue DESC')
    .limit(quantity)
  end

  def self.most_items(quantity)
    select('merchants.*, SUM(invoice_items.quantity) as total_number')
    .joins(items: :invoice_items)
    .group(:id)
    .order('total_number DESC')
    .limit(quantity)
  end

end
