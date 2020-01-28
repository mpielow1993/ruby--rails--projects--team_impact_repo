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
      render 'admin/lessons/new'
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)
    if @lesson.save
      flash[:success] = "Lesson updated successfully"
      redirect_to admin_lessons_path
    else
      render 'admin/lessons/edit'
    end
  end

  #An index view for admins only
  def index
    @lessons = Lesson.all.unscoped.order(id: :desc).paginate(page: params[:page])
  end

  def show
    @lesson = Lesson.find(params[:id])
    @registrations = @lesson.registrations.paginate(page: params[:page])
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:success] = "Lesson successfully destroyed"
    redirect_to admin_lessons_path
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
