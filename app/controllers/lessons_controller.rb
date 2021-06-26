class LessonsController < ApplicationController
    before_action :logged_in_member
    before_action :correct_member, only: :private_timetable
    #respond_to :html, :js


  def public_timetable
    @date = current_lesson_date
    #@subscription = current_subscription
    @lessons = Array.wrap(Lesson.where(date: @date))
    @registration = Registration.new
  end

  def private_timetable
    @date = current_lesson_date
    @lessons = Array.wrap(current_member.lessons.where(date: @date))
  end

  def search_timetable
    session[:lesson_date] = params[:search][:lesson_date]
    #session[:subscription_id] = params[:search][:subscription_id]
    redirect_to request.referrer
  end

  def reg_flash
    flash.dup
  end

end
