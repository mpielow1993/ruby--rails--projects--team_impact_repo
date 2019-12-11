class Admin::RegistrationsController < ApplicationController

  def index
    @member = Member.find(params[:member_id])
    @registrations = Registration.where(member_id: @member.id).order(lesson_date: :desc).paginate(page: params[:page])
  end
  
  def create
    @lesson = Lesson.find(params[:lesson_id])
    @registration = @lesson.registrations.build(registration_params)
    if @registration.save
      flash[:success] = "You have successfully registered for the chosen lesson"
      redirect_to admin_lesson_registrations_path(@lesson)
    else
      flash[:danger] = "Registration failed"
      redirect_to request.referrer
    end
  end

  def destroy
    @lesson = Lesson.find(params[:lesson_id])
    @registration = @lesson.registrations.find(params[:id])
    @registration.destroy
    flash[:success] = "You have successfully unregistered member '#{@registration.member.id}' from lesson '#{@lesson.id}'"
    redirect_to admin_lesson_registrations_path(@lesson)
  end
  
  private
    
    def registration_params
      params.require(:registration).permit(:subscription_id, :member_id)
    end
end
