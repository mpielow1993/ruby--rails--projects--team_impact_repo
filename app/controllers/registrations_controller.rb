class RegistrationsController < ApplicationController

  def index
    @member = Member.find(params[:member_id])
    @registrations = Registration.where(member_id: @member.id).order(lesson_date: :desc).paginate(page: params[:page])
  end
  
  def create
    @member = Member.find(params[:member_id])
    @lesson = Lesson.find(params[:lesson_id])
    @date = params[:lesson_date]
    @registration = Registration.create(registration_params)
    if @registration.save
      flash[:success] = "You have successfully registered for the chosen lesson"
      redirect_to member_registrations_path(lesson_date: @date)
      #render 'lessons/lesson', lesson: @lesson
    else
      flash[:danger] = "Registration unsuccessful"
      redirect_to lessons_public_timetable_path
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    flash[:success] = "You have successfully unregistered"
    redirect_to member_registrations_path(current_member)
  end
  
  def search
    @member = Member.find(params[:member_id])
    @all_registrations = Registration.where(member_id: @member.id)
    @date = params[:search][:lesson_date]
    @registrations = @all_registrations.find_by(lesson_date: @date)
  end
  
  private
  
    def registration_params
      params.permit(:member_id, :lesson_id, :lesson_date)
    end
end
