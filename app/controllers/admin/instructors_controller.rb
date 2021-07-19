class Admin::InstructorsController < Admin::AdminApplicationController
  
  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.create!(instructor_params)
    if @instructor.save
      flash[:success] = "Instructor successfully created"
      redirect_to admin_instructors_path
    else
      render 'admin/instructors/new'
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    check_existence(@instructor, admin_instructors_path, "Instructor not found")
    @instructor.update(instructor_params)
    if @instructor.save
      flash[:success] = "Instructor updated successfully"
      redirect_to admin_instructors_path
    else
      flash.now[:danger] = "An error occurred updating the instructor. Please try again."
      render 'admin/instructors/edit'
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    check_existence(@instructor, admin_instructors_path, "Instructor not found")
    if @instructor.destroy
      flash[:success] = "Instructor removed successfully"
      redirect_to instructors_path
    else
      flash.now[:danger] = "An error occurred removing the instructor. Please try again"
      render 'admin/instructors/index'
    end
  end

  def index
    @instructors = Instructor.all.paginate(page: params[:page])
  end

  def show
      @instructor = Instructor.find(params[:id])
      check_existence(@instructor, admin_instructors_path, "Instructor not found")
      @instructor_description_url = "app/views/instructors/_#{@instructor.first_name.downcase}_#{@instructor.last_name.downcase}.html.erb"
  end

  private

    def instructor_params
      params.require(:instructor).permit(:first_name, :last_name, :avatar, :remove_avatar, :role)
    end
end
