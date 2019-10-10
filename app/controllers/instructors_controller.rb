class InstructorsController < ApplicationController
  def new
    #Future implementation
  end

  def create
    #Future implementation
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
end
