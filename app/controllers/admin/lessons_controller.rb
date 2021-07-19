class Admin::LessonsController < Admin::AdminApplicationController

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.create(lesson_params)
    if @lesson.save
      flash[:success] = "Lesson created successfully"
      redirect_to admin_lessons_path
    else
      flash.now[:danger] = "An error occurred creating this lesson"
      render 'admin/lessons/new'
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    check_existence(@lesson, admin_lessons_path, "Lesson not found")
  end

  def update
    @lesson = Lesson.find(params[:id])
    check_existence(@lesson, admin_lessons_path, "Lesson not found")
    @lesson.update(lesson_params)
    if @lesson.save
      flash[:success] = "Lesson updated successfully"
      redirect_to admin_lessons_path
    else
      flash.now[:danger] = "An error occurred updating the selected lesson"
      render 'admin/lessons/edit'
    end
  end

  #An index view for admins only
  def index
    @lessons = Lesson.all.unscoped.order(id: :desc).paginate(page: params[:page])
    #@lesson = Lesson.find(params)
  end

  def show
    @lesson = Lesson.find(params[:id])
    check_existence(@lesson, admin_lessons_path, "Lesson not found")
    @registrations = @lesson.registrations.paginate(page: params[:page])
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    check_existence(@lesson, admin_lessons_path, "Lesson not found")
    if @lesson.destroy
      flash[:success] = "Lesson successfully removed"
      redirect_to admin_lessons_path
    else
      flash.now[:danger] = "An error occurred removing the selected lesson. Please try again."
      render 'admin/lessons/index'
    end
  end

  private

    # Confirms an admin member.
    def admin_member
      redirect_to(root_url) unless current_member.admin?
    end

    def lesson_params
      params.require(:lesson).permit(:date, :start_time, :end_time, :instructor_id, :facility_id, :programme_id, :level, :is_expired)
    end

end
