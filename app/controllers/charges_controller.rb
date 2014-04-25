require 'product'

class ChargesController < ApplicationController

	def new
    @order = Order.find(params[:order_id], include: :user)
	end

	def create
		@amount=150
    @order = current_user.orders.last
    @description = current_user.name
	  customer = Stripe::Customer.create(
	    :email => current_user.email,
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => @description,
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

	def index
	end
end