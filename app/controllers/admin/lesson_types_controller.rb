class Admin::LessonTypesController < ApplicationController
  def add
    @lesson_type = LessonType.new
  end

  def create
    @lesson_type = LessonType.build(lesson_type_params)
    if @lesson_type.save
      flash[:success] = 'Lesson Type saved successfully'
      params[:show_header_alert_message] = true
      redirect_to new_admin_lesson_type_path
    else
      redirect_to admin_lesson_types_path
    end
  end

  def index
    @filter_array = []
    if !lesson_type_params.empty?
      if !lesson_type_params[:name].empty?
        @filter_array[:name] = lesson_type_params[:name]
      end
    end
    @lesson_types = filter(LessonType.all, filter_array)
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