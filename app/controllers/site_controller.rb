require 'mailchimp'

class SiteController < ApplicationController


  def index

    redirect_to "/dental"
    # begin
    #   lists_res = @mc.lists.list
    #   @lists = lists_res['data']
    # rescue Mailchimp::Error => ex
    #   if ex.message
    #     flash[:error] = ex.message
    #   else
    #     flash[:error] = "An unknown error occurred"
    #   end
    #   redirect_to "/"
    # end
  end

  def view
    list_id = params[:id]
    begin
      lists_res = @mc.lists.list({'list_id' => list_id})
      @list = lists_res['data'][0]
      members_res = @mc.lists.members(list_id)
      @members = members_res['data']
    rescue Mailchimp::ListDoesNotExistError
      flash[:error] = "The list could not be found"
      redirect_to "/lists/"
    rescue Mailchimp::Error => ex
      if ex.message
        flash[:error] = ex.message
      else
        flash[:error] = "An unknown error occurred"
      end
      redirect_to "/lists/"
    end
  end
  

  def subscribe


    list_id = 'b87cecaa20'
    email = params['email']
  
    begin
      @mc.lists.subscribe(params[:list_id], {'email'=> email}, {'apikey'=> 'edb6d70c66f39ec8d47fc805140b1c08-us3'}, {:double_optin => false }, :send_welcome => false)
      flash[:success] = "#{email} subscribed successfully"
    rescue Mailchimp::ListAlreadySubscribedError
      flash[:error] = "#{email} is already subscribed to the list"
    rescue Mailchimp::ListDoesNotExistError
      flash[:error] = "The list could not be found"
        redirect_to "/success"

      return
    rescue Mailchimp::Error => ex
      if ex.message
        flash[:error] = ex.message
      else
        flash[:error] = "An unknown error occurred"
      end
    end
    redirect_to "/success"
  end


end
