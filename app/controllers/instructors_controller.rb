class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.all.paginate(page: params[:page])
  end

  def show
      @instructor = Instructor.find(params[:id])
      @instructor_description_url = "app/views/instructors/_#{@instructor.first_name.downcase}_#{@instructor.last_name.downcase}.html.erb"
  end
  
end
