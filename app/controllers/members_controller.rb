class MembersController < ApplicationController
  def new
    @member = Member.new
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def create
    @member = Member.new(member_params) 
    # Not the final implementation! 
    if @member.save
      log_in @member
      # Handle a successful save. 
      flash[:success] = "Welcome to your Team Impact account"
      redirect_to @member
    else 
      render 'new' 
    end
  end
  
  private
  
  def member_params
    params.require(:member).permit(:user_name, :first_name, :last_name, :email, :phone_no, :password, :password_confirmation)
  end
end
