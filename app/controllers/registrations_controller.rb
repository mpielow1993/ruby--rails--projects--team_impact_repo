class RegistrationsController < ApplicationController
  before_create! :check_subscription_active, :check_subscription_count

  def index
    @member = Member.find(params[:member_id])
    @registrations = Registration.where(member_id: @member.id).order(lesson_date: :desc).paginate(page: params[:page])
  end
  
  def create
    #@member = Member.find(params[:member_id])
    #@subscription = @member.subscriptions.find(params[:search][:subscription_id])
    #@lesson = Lesson.find(params[:lesson_id])
    @registration = Registration.new(lesson_id: params[:lesson_id], susbcription_id: params[:search][:subscription_id], member_id: params[:member_id])
    @registration.save
    if @registration.save
      flash[:success] = "You have successfully registered for the chosen lesson"
      redirect_to public_timetable_path(@date)
      #render 'lessons/lesson', lesson: @lesson
    else
      flash[:danger] = "Registration unsuccessful"
      redirect_to public_timetable_path(@date)
    end
  end

  def destroy
    @member = Member.find(params[:member_id])
    @subscription = @member.subscriptions.find([:search][:subscription_id])
    @registration = @subscription.registrations.find(params[:id])
    @registration.destroy
    flash[:success] = "You have successfully unregistered"
    redirect_to member_subscription_registrations_path(@member, @subscription)
  end
  
  def show
  end
  
  private
  
    def registration_params
      params.require(:registration).permit(:member_id, [:search][:subscription_id], :lesson_id)
    end
    
    def check_subscription_active
      unless subscription.is_active = true
        errors.add(:base, "The subscription used to register for this class must be active")
      end
    end

    def check_subscription_count
      @subscription = Subscription.find([:search][:subscription_id])
      @membership = @subscription.membership
      if @membership.class.name = "FiveClassPass" && @subscription.registrations.count >= 5
        @subscription.is_active = false
      end
      
      if @membership.class.name = "TenClassPass" && @subscription.registrations.count >= 10
        @subscription.is_active = false
      end
    end
    
end
