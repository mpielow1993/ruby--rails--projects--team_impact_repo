class LessonsController < ApplicationController
    before_action :logged_in_member, only: [:index, :show, :create, :new, :update, :destroy, :public_timetable, :private_timetable, :search_timetable]
    before_action :admin_member, only: [:index, :show, :create, :new, :update, :destroy]
  
  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.create(lesson_params)
    if @lesson.save
      flash[:success] = "Lesson created successfully"
      redirect_to admin_lessons_path
    else
      render 'new'
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)
    if @lesson.save
      flash[:success] = "Lesson updated successfully"
      redirect_to admin_lessons_path
    else
      render 'edit'
    end
  end

  #An index view for admins only
  def index
    @lessons = Lesson.all.paginate(page: params[:page])
  end
  
  def public_timetable
    @date = current_lesson_date
    @subscription = current_subscription
    @lessons = Array.wrap(Lesson.where(date: @date))
    @registration = Registration.new
  end
  
  def private_timetable
    @date = current_lesson_date
    @lessons = Array.wrap(current_member.lessons.where(date: @date))
  end
  
  def search_timetable
    session[:lesson_date] = params[:search][:lesson_date]
    session[:subscription_id] = params[:search][:subscription_id]
    redirect_to request.referrer
  end

  def show
    @date = current_lesson_date
    @lesson = Lesson.find(params[:id])
  end
  
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:success] = "Lesson successfully destroyed"
    redirect_to admin_lessons_path
  end
  
  private
  
    # Confirms an admin member. 
    def admin_member 
      redirect_to(root_url) unless current_member.admin? 
    end
    
    def lesson_params
      params.require(:lesson).permit(:date, :start_time, :end_time, :instructor_id, :facility_id, :programme_id, :level)
    end
    
end
