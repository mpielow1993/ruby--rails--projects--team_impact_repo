class Admin::AccountActivationsController < Admin::AdminApplicationController

    before_action :get_member, only: [:edit, :update] 
    before_action :valid_member, only: [:edit, :update]
    before_action :check_expiration, only: [:edit, :update]

    def edit 
      @member = Member.find_by(email: params[:email]) 
    end

    #The 'update' action for password resets
    def update 
      @member = Member.find_by(email: params[:email]) 
      if !@member || @member.activated? || !@member.authenticated?(:reset, params[:id])
        flash[:danger] = "Invalid Activation Link" 
        redirect_to root_url
      end
      if params[:member][:password].empty? 
        @member.errors.add(:password, "can't be empty") 
        render 'edit' 
      elsif @member.update(member_params) 
        @member.activate
        log_in @member
        #Clearing the reset digest on a successful password reset
        @member.update_attribute(:reset_digest, nil)
        flash[:success] = "Account Activated successfully with new password."
        redirect_to @member 
      else 
        render 'edit'
      end 
    end
    
  
    private 
  
      def member_params
        params.require(:member).permit(:user_name, :first_name, :last_name, :email, :phone_no, :password, :password_confirmation, :avatar, :remove_avatar)
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
          redirect_to new_password_reset_url 
        end 
      end
  end
  