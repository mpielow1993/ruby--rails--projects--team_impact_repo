class Admin::RegistrationsController < Admin::AdminApplicationController

  def index
    @member = Member.find(params[:member_id])
    check_existence(@member, admin_lesson_registrations_path, "Registration for selected lesson not found")
    @registrations = Registration.where(member_id: @member.id).order(lesson_date: :desc).paginate(page: params[:page])
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    check_existence(@member, admin_lesson_registrations_path, "Registration for selected lesson not found")
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
    check_existence(@lesson, admin_lesson_registrations_path, "Lesson not found")
    @registration = @lesson.registrations.find(params[:id])
    check_existence(@registration, admin_lesson_registrations_path, "Registration for selected lesson not found")
    if @registration.destroy
      flash[:success] = "You have successfully unregistered member '#{@registration.member.id}' from lesson '#{@lesson.id}'"
      redirect_to admin_lesson_registrations_path(@lesson)
    else
      flash[:danger] = "An error occurred unregistering the selected member from the selected lesson. Please try again."
      redirect_to request.referrer
    end
  end

  private

    def registration_params
      params.require(:registration).permit(:subscription_id, :member_id)
    end
end
