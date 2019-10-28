class MembersController < ApplicationController
  #calls methods 'logged_in_user' and 'correct_user' before given actions
  before_action :logged_in_member, only: [:edit, :update, :index, :show, :destroy]
  before_action :correct_member, only: [:edit, :update, :show]
  #A before filter restricting the 'destroy' action to admins
  before_action :admin_member, only: [:destroy, :index]
  
  def index
    #Shows only active members
    @members = Member.where(activated: true).paginate(page: params[:page])
  end
  
  def new
    @member = Member.new
  end
  
  def show
    @member = Member.find(params[:id])
    #@all_lessons = Lesson.all.paginate(page: params[:page]).per_page(20)
    #@lessons = Lesson.search(params[:search][:date])
    #display the date in the heading
    #@date = params[:search][:date].to_date.strftime("%d" +  " " + "%B" +  " " +  "%Y")
    #Show the admin's own posts
    #@newswire_posts = @member.newswire_posts.paginate(page: params[:page])
  end
  
  def create
    @member = Member.new(member_params) 
    # Not the final implementation! 
    if @member.save
      #log_in @member
      # Handle a successful save. 
      #flash[:success] = "Welcome to your Team Impact account"
      #redirect_to @member
      
      #Adding account activation to user sign-up
      #MemberMailer.account_activation(@member).deliver_now 
      
      #Sending email via the Member model object
      @member.send_activation_email
      flash[:info] = "Please check your email to activate your Team Impact account."
      redirect_to root_url
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
  
  #def lesson_params
   # params.require(:lesson).permit(:date, :start_time, :end_time, :instructor_id, :facility_id, :programme_id, :level, :search)
  #end
  
  #Before filters
  
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
