class RegistrationsController < ApplicationController
  before_create! :check_subscription_active, :check_subscription_count

  def index
    @member = Member.find(params[:member_id])
    @registrations = Registration.where(member_id: @member.id).order(lesson_date: :desc).paginate(page: params[:page])
  end
  
  def create
    @member = Member.find(params[:member_id])
    @lesson = Lesson.find(params[:lesson_id])
    @subscription = Subscription.find(params[:search][:subscription_id])
    @date = params[:search][:lesson_date]
    @registration = Registration.new(lesson_id: @lesson.id, subscription_id: @subscription.id, lesson_date: @date)
    if @registration.save
      flash[:success] = "You have successfully registered for the chosen lesson"
      redirect_to lessons_public_timetable_path(@date)
      #render 'lessons/lesson', lesson: @lesson
    else
      flash[:danger] = "Registration unsuccessful"
      redirect_to lessons_public_timetable_path(@date)
    end
  end

  def destroy
    current_member.subscriptions.find(params[:subscription_id]).registrations.find(params[:id]).destroy
    flash[:success] = "You have successfully unregistered"
    redirect_to member_path(@member)
    #render 'lessons/public_timetable'
  end
  
  def search
    @member = Member.find(params[:member_id])
    @all_registrations = Registration.where(member_id: @member.id)
    @date = params[:search][:lesson_date]
    @registrations = @all_registrations.find_by(lesson_date: @date)
  end
  
  def show
  end
  
  private
  
    def registration_params
      params.require(:registration).permit(:id, :member_id, :lesson_id, :search => [:lesson_date, :subscription_id])
    end
    
    def check_subscription_active
      unless subscription.is_active = true
        errors.add(:base, "The subscription used to register for this class must be active")
      end
    end

    def check_subscription_count
      @subscription = Subscription.find(params[:id])
      @membership = @subscription.membership
      if @membership.class.name = "FiveClassPass" && @subscription.registrations.count >= 5
        @subscription.is_active = false
      end
      
      if @membership.class.name = "TenClassPass" && @subscription.registrations.count >= 10
        @subscription.is_active = false
      end
    end
end
