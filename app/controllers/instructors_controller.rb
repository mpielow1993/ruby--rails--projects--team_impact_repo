class InstructorsController < ApplicationController
  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.create!(instructor_params)
    if @instructor.save
      flash[:success] = "Instructor successfully created"
    end
  end

  def edit
    #Future implementation
  end

  def update
    #Future implementation
  end

  def destroy
    #Future implementation
  end

  def index
    @instructors = Instructor.all
  end

  def show
      @instructor = Instructor.find(params[:id])
  end
  
  private
    
    def instructor_params
      params.require(:instructor).permit(:first_name, :last_name, :instructor_avatar, :remove_instructor_avatar, :role)
    end
end
