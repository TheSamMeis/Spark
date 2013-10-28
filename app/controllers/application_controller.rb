require 'mailchimp'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup_mcapi

	  def setup_mcapi
	    @mc = Mailchimp::API.new('edb6d70c66f39ec8d47fc805140b1c08-us3')
	  end





end
