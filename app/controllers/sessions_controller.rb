class SessionsController < ApplicationController
  
  def create
    @member = Member.find_by(user_name: params[:session][:user_name])
    #check_existence(@member, root_url, "Member not found")
    if @member && @member.authenticate(params[:session][:password])
      if @member.activated? 
        # Log the member in and redirect to the member's show page
        log_in @member 
        params[:session][:remember_me] == '1' ? remember(@member) : forget(@member) 
        redirect_back_or @member
        #Preventing unactivated members from logging in
      else 
        message = "Account not activated. " 
        message += "Check your email for the activation link." 
        flash[:warning] = message
        redirect_to root_url 
      end
    else
      #Display an error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'sessions/new'
    end
  end
  
  def new
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
