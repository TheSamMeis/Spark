class CheckoutController < ApplicationController

	def new
	end

	def create

		@name=params[:name]
		@quantity=params[:quantity]
		redirect_to :controller => 'charges', :action => 'new', :name => @name, :quantity => @quantity
	end

end