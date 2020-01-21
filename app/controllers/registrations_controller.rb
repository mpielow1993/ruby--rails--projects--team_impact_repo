class RegistrationsController < ApplicationController
  #respond_to :html, :js
  before_action :logged_in_member

  def create
    @date = current_lesson_date
    @lesson = Lesson.find(params[:lesson_id])
    @registration = @lesson.registrations.build(registration_params)
    if @registration.save
      flash.dup[:success] = " Registration Successful"
      respond_to do |format|
        format.html {}
        format.js {}
      end
    else
      flash.dup[:danger] = "Already registered with subscription '#{current_member.subscription_used_to_register_for(@lesson).subscription_name}'"
      respond_to do |format|
        format.html {}
        format.js {}
      end
    end
  end

  def destroy
    @date = current_lesson_date
    @lesson = Lesson.find(params[:lesson_id])
    @registration = @lesson.registrations.find(params[:id])
    @registration.destroy
    flash.dup[:success] = "Deregistration Successful"
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  private

    def registration_params
      params.require(:registration).permit(:subscription_id, :member_id)
    end

    def reg_flash
      flash.dup
    end
end
