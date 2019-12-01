class InstructorsController < ApplicationController
  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.create!(instructor_params)
    if @instructor.save
      flash[:success] = "Instructor successfully created"
      redirect_to instructors_path
    else
      render 'new'
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:id])
    @instructor.update(instructor_params)
    if @instructor.save
      flash[:success] = "Instructor updated successfully"
      redirect_to instructor_path(@instructor)
    else
      render 'edit'
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    flash[:success] = "Instructor removed successfully"
    redirect_to instructors_path
  end

  def index
    @instructors = Instructor.all
  end

  def show
      @instructor = Instructor.find(params[:id])
      @instructor_description_url = "app/views/instructors/_#{@instructor.first_name.downcase}_#{@instructor.last_name.downcase}.html.erb"
  end
  
  private
    
    def instructor_params
      params.require(:instructor).permit(:first_name, :last_name, :instructor_avatar, :remove_instructor_avatar, :role)
    end
end
