class LessonsController < ApplicationController
    before_action :logged_in_member, :correct_member, :admin_member, only: [:index, :show, :create, :new, :update, :destroy]
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def index
    @lesson = Lesson.find(params[:id])
    @lessons = Lesson.all
  end

  def show
  end
end
