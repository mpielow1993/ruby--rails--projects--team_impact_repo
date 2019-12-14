class RegistrationsController < ApplicationController
before_action :logged_in_member

  def create
    @date = current_lesson_date
    @lesson = Lesson.find(params[:lesson_id])
    @registration = @lesson.registrations.build(registration_params)
    if @registration.save
      flash[:success] = "You have successfully registered for the chosen lesson"
      redirect_to member_private_timetable_path(current_member, @date)
    else
      flash[:danger] = "You have already registered for this lesson with subscription '#{current_member.subscription_used_to_register_for(@lesson)}'"
      redirect_to request.referrer
    end
  end

  def destroy
    @date = current_lesson_date
    @lesson = Lesson.find(params[:lesson_id])
    @registration = @lesson.registrations.find(params[:id])
    @registration.destroy
    flash[:success] = "You have successfully unregistered"
    redirect_to public_timetable_path(@date)
  end
  
  private
    
    def registration_params
      params.require(:registration).permit(:subscription_id, :member_id)
    end
end
