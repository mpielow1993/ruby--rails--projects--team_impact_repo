class SessionsController < ApplicationController
  
  def create
    member = Member.find_by(user_name: params[:session][:user_name])
    if member &.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page
     log_in(member)
     redirect_to member
    else
      #Display an error message
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def new
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
