class ChargesController < ApplicationController
	def new
		

		@name = params[:name]
		@quantity = params[:quantity]
		@amount = @quantity.to_f * 3500
		@amount_formatted = @amount/100
		
	end

	def create
	  # Amount in cents
	  

	  customer = Stripe::Customer.create(
	    :email => params[:email],
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => 600,
	    :description => params[:stripeDescription],
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end




