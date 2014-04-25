class CheckoutController < ApplicationController

	def new
	end

	def create
		redirect_to controller: 'charges', action: 'new',
                 order_id: create_order(params[:quantity]).to_param

    # redirect_to generate_url('https://sparkentrepreneurship.herokuapp.com/charges/new',
    #  :order_id => create_order(params[:quantity]))
	end

  def index
    @orders=Order.all
  end

  def show
  end

private

  def create_user(name, email)
    user = User.create_user(name, email)
    set_current_user(user)
    user
  end

  def create_order(quantity)
    user = create_user(params[:name], params[:email])
    Order.create_customer_order(user, params[:quantity])
  end

end
