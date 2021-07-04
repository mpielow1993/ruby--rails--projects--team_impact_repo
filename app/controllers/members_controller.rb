class MembersController < ApplicationController
  before_action :logged_in_member, :correct_member, only: [:edit, :update, :show]
  
  def new
    @member = Member.new
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def create
    @member = Member.new(member_params) 
    if @member.save
      @member.send_activation_email
      flash[:info] = "Please check your email to activate your Team Impact account."
      redirect_to root_url
    else 
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
      render 'members/edit'
    end 
  end
  
  private
  
  def member_params
    params.require(:member).permit(:user_name, :first_name, :last_name, :email, :phone_no, :password, :password_confirmation, :member_avatar, :remove_member_avatar)
  end
  
end
