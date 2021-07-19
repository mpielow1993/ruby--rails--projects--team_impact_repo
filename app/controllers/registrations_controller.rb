class RegistrationsController < ApplicationController
  #respond_to :html, :js
  before_action :logged_in_member

  def create
    @date = current_lesson_date
    @lesson = Lesson.find(params[:lesson_id])
    @registration = @lesson.registrations.build(registration_params)
    if @registration.save
      flash.now[:success] = "Registration Successful" #if params[:registration][:show_bootstrap_alert_message]
      respond_to do |format|
        format.html {}
        format.js {}
      end
    else
      flash.now[:danger] = "An error occurred registering for this lesson with the chosen subscription" #if params[:show_bootstrap_alert_message]
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
    if @registration.destroy
      flash.now[:success] = "Successfully unregistered from lesson" #if params[:registration][:show_bootstrap_alert_message]
      respond_to do |format|
        format.html {}
        format.js {}
      end
    else
      flash.now[:danger] = "An error occurred in unregistering from this lesson"
    end
  end

  private

    def registration_params
      params.require(:registration).permit(:subscription_id, :member_id)
    end

end
