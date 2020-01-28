class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.all.paginate(page: params[:page])
    @instructor_page_quotation = instructor_page_quotation
  end

  def show
      @instructor = Instructor.find(params[:id])
      @instructor_description_url = "app/views/instructors/_#{@instructor.first_name.downcase}_#{@instructor.last_name.downcase}.html.erb"
  end

  def instructor_page_quotation
    "'The mediocre teacher tells,
    the good teacher explains, the superior teacher demonstrates,
    the great teacher inspires...' - William Arthur Ward"
  end

end
