class MembersController < ApplicationController
  before_action :logged_in_member, :correct_member, only: [:edit, :update, :show]
  
  def new
    @member = Member.new
  end
  
  def show
    @member = Member.find(params[:id])
    check_existence(@member, root_url, "Member not found")
  end
  
  def create
    @member = Member.new(member_params) 
    if @member.save
      create_activation_digest(@member)
      @member.send_activation_email
      flash[:info] = "Please check your email to activate your Team Impact account."
      redirect_to root_url
    else 
      flash.now[:danger] = "An error occurred creating your new account. Please try again."
      render 'members/new' 
    end
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      #Handle a successful update
      flash[:success] = "Profile updated" 
      redirect_to member_path(@member)
    else
      flash.now[:danger] = "An error occurred updating your profile"
      render 'members/edit'
    end 
  end
  
  private
  
    def member_params
      params.require(:member).permit(:user_name, :first_name, :last_name, :phone_no, :password, :password_confirmation, :avatar, :remove_avatar)
    end

    def create_activation_digest(member)
      member.activation_token = Member.new_token
      member.update_columns({activation_digest: Member.digest(member.activation_token)})
    end
  
end
