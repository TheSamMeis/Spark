require 'product'

class Order < ActiveRecord::Base
  belongs_to :user

  def self.create_customer_order(user, quantity)
    order = user.orders.new
    order.quantity = quantity
    order.save
    order
  end

  def total_amount_formatted
    Product.amount*quantity
  end
end
