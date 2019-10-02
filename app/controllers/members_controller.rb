class MembersController < ApplicationController
  #calls methods 'logged_in_user' and 'correct_user' before given actions
  before_action :logged_in_member, only: [:edit, :update, :index, :destroy]
  before_action :correct_member, only: [:edit, :update]
  #A before filter restricting the 'destroy' action to admins
  before_action :admin_member, only: :destroy
  
  def index
    @members = Member.paginate(page: params[:page])
  end
  
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
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      #Handle a successful update
      flash[:success] = "Profile updated" 
      redirect_to @member
    else
      render 'edit'
    end 
  end
  
  #Adding a working 'destroy' action
  def destroy 
    Member.find(params[:id]).destroy 
    flash[:success] = "Member deleted" 
    redirect_to members_url 
  end

  private
  
  def member_params
    params.require(:member).permit(:user_name, :first_name, :last_name, :email, :phone_no, :password, :password_confirmation)
  end
  
  #Before filters
  
  # Confirms a logged-in member. 
  def logged_in_member 
    unless logged_in?
    
    #Adding store_location to the logged-inuser before ﬁlter
    store_location
    flash[:danger] = "Please log in." 
    redirect_to log_in_url 
    end 
  end
  
  # Confirms the correct member. 
  def correct_member 
    @member = Member.find(params[:id]) 
    redirect_to(root_url) unless current_member?(@member)
  end
  
  # Confirms an admin member. 
  def admin_member 
    redirect_to(root_url) unless current_member.admin? 
  end
end
