class PasswordResetsController < ApplicationController
  
  #To get the password reset form to render, we need to deﬁne an @member variable in the Password Resets controller’s 'edit' action. 
  #As with account activation, this involves ﬁnding the member corresponding to the email address in params[:email]. 
  #We then need to verify that the user is valid,i.e.,that it exists, is activated, and is authenticated according to the reset token from params[:id] 
  #(using the generalized authenticated? method). 
  #Because the existence of a valid @user is needed in both the 'edit' and 'update' actions, we’ll put the code to ﬁnd and validate it in a couple of 
  #before ﬁlters
  
  #The edit action for password reset
  before_action :get_member, only: [:edit, :update] 
  before_action :valid_member, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  def edit
    
  end
  def new
  end
  
  #A 'create' action for password resets
  
  def create 
    @member = Member.find_by(email: params[:password_reset][:email]) 
    if @member 
      @member.create_reset_digest 
      @member.send_password_reset_email 
      flash[:info] = "Email sent with password reset instructions" 
      params[:show_header_alert_message] = true
      redirect_to root_url 
    else 
      flash.now[:danger] = "Email address not found" 
      params[:show_header_alert_message] = true
      render 'new' 
    end 
  end
  
  #The 'update' action for password resets
  
  def update 
    if params[:member][:password].empty? 
      @member.errors.add(:password, "can't be empty") 
      render 'edit' 
    elsif @member.update(member_params) 
      log_in @member
      
      #Clearing the reset digest on a successful password reset
      @member.update_attribute(:reset_digest, nil)
      flash[:success] = "Password has been reset." 
      params[:show_header_alert_message] = true
      redirect_to @member 
    else 
      render 'edit'
    end 
  end
  

  private 
  
    def member_params 
      params.require(:member).permit(:password, :password_confirmation) 
    end
    
    def get_member 
      @member = Member.find_by(email: params[:email]) 
    end 
    
    # Confirms a valid member. 
    def valid_member 
      unless (@member && @member.activated? && @member.authenticated?(:reset, params[:id])) 
        redirect_to root_url 
      end 
    end
    
    # Checks expiration of reset token. 
    def check_expiration 
      if @member.password_reset_expired? 
        flash[:danger] = "Password reset has expired." 
        params[:show_header_alert_message] = true
        redirect_to new_password_reset_url 
      end 
    end
end
