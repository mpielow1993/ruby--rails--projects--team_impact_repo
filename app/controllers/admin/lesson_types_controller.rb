class Admin::LessonTypesController < ApplicationController

  def add
    @lesson_type = LessonType.new
  end

  def create
    @lesson_type = LessonType.build(lesson_type_params)
    if @lesson_type.save
      flash[:success] = 'Lesson Type saved successfully'
      redirect_to new_admin_lesson_type_path
    else
      redirect_to admin_lesson_types_path
    end
  end

  #POST THE FILTER FORM TO THE INDEX PATH!!!!!

  def index
    @conditions = []
    @lesson_types = @conditions.empty? ? LessonType.all : LessonType.where(@conditions)
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

    def lesson_type_params
      params.require(:lesson_type).permit(:name)
    end
end
