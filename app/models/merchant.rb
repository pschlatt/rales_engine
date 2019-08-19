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
    select("merchants.*, SUM(invoice_items.quantity) AS total_number")
     .joins(invoices: :transactions)
     .joins(invoices: :invoice_items)
     .merge(Transaction.where(result: :success))
     .group(:id)
     .order("total_number DESC")
     .limit(quantity)
  end

  def self.most_revenue_by_date(date)
    Invoice.joins(:invoice_items, :transactions)
  			.merge(Transaction.where(result: :success))
  			.where({invoices: {created_at: (date.to_date.all_day)}})
  			.sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def  self.favorite_customer(id)
    Customer.select("customers.*, COUNT(transactions.result) as count")
            .joins(invoices: :transactions)
            .merge(Transaction.where(result: :success))
            .group(:id)
            .order("count DESC")
            .where(invoices: {merchant_id: id})
            .limit(1)
  end

  # GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.


  # def complete_revenue
  #   invoices.joins(:transactions, :invoice_items)
  #   .sum("invoice_items.quantity * invoice_items.unit_price")
  # end

end
