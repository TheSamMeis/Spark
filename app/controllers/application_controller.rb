require 'mailchimp'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :setup_mcapi

  def setup_mcapi
    @mc = Mailchimp::API.new('edb6d70c66f39ec8d47fc805140b1c08-us3')
  end

  def current_user
    @current_user || User.find(session[:user_id]) if session[:user_id].present?
  end

  def set_current_user(user)
    session[:user_id] = user.id
  end

def generate_url(url, params = {})
  uri = URI(url)
  uri.query = params.to_query
  uri.to_s
end



end
