class Admin::AccountActivationsController < Admin::AdminApplicationController

  def edit 
    @member = Member.find_by(user_name: params[:user_name]) 
    check_existence(@member, root_url, "Member Not Found")
  end

  #The 'update' action for password resets
  def update 
    @member = Member.find_by(user_name: params[:user_name]) 
    check_existence(@member, root_url, "Member Not Found", true)
    check_expiration(@member, true)
    if @member.activated? || !@member.authenticated?(:reset, params[:id])
      flash[:danger] = "Invalid Activation Link" 
      redirect_to root_url and return
    end
    if params[:member][:password].empty? 
      @member.errors.add(:password, "can't be empty") 
      render 'admin/account_activations/edit' 
    elsif @member.update(member_params) 
      #@member.activate
      log_in @member
      #Clearing the reset digest on a successful password reset
      @member.update_attributes({reset_digest: nil, activated: true})
      flash[:success] = "Account Activated successfully with new password."
      redirect_to @member 
    else 
      flash.now[:danger] = "An error occurred activating the account"
      render 'admin/account_activations/edit'
    end 
  end
  

  private 

    def member_params
      params.require(:member).permit(:user_name, :first_name, :last_name, :phone_no, :password, :password_confirmation, :avatar, :remove_avatar)
    end
    
    # Confirms a valid member. 
    def valid_member 
      unless (@member && @member.activated? && @member.authenticated?(:reset, params[:id])) 
        redirect_to root_url 
      end 
    end
    
    # Checks expiration of reset token. 
    def check_expiration(member, and_return = false)
      if member.password_reset_expired? 
        flash[:danger] = "Password reset has expired." 
        if and_return
          redirect_to new_password_reset_url and return
        else
          redirect_to new_password_reset_url
        end 
      end 
    end
end
  