class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.all.paginate(page: params[:page])
    @instructor_page_quotation = instructor_page_quotation
  end

  def show
      @instructor = Instructor.find(params[:id])
      check_existence(@instructor, instructors_path, "Instructor not found")
      @instructor_bio_path = Rails.root.join("app/views/instructors/instructor_bios/_#{@instructor.full_name.downcase.gsub(" ", "_")}.html.erb")
  end

  def instructor_page_quotation
    "'The mediocre teacher tells,
    the good teacher explains, the superior teacher demonstrates,
    the great teacher inspires...' - William Arthur Ward"
  end

end
