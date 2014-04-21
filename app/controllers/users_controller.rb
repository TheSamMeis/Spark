class UsersController < ApplicationController
	def new
    

    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Signed up!"
    else
      render :action => :new
    end
  rescue Stripe::CardError => e
    @user.errors.add :base, e.message
    @user.stripe_token = nil
    render :action => :new

  rescue Stripe::StripeError => e
    logger.error e.message
    @user.errors.add :base, "There was a problem with your credit card"
    @user.stripe_token = nil
    render :action => :new
  end
end
