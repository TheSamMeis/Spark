class User < ActiveRecord::Base
  attr_accessible :name, :email, :stripe_token

  attr_accessor :stripe_token
  before_save :update_stripe

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email


  def stripe_description
    "#{name}: #{email}"
  end

  def update_stripe
    if stripe_id.nil?
      if !stripe_token.present?
        raise "We're doing something wrong -- this isn't supposed to happen"
      end

      customer = Stripe::Customer.create(
        :email => email,
        :description => stripe_description,
        :card => stripe_token
      )
      
    else
      customer = Stripe::Customer.retrieve(stripe_id)

      if stripe_token.present?
        customer.card = stripe_token
      end

      # in case they've changed
      customer.email = email
      customer.description = stripe_description

      customer.save

   
    end

    self.stripe_id = customer.id
    self.stripe_token = nil
  end
end