class LessonsController < ApplicationController
    before_action :logged_in_member, :admin_member, only: [:index, :show, :create, :new, :update, :destroy, :public_timetable, :search_public_timetable]
  
  def new
    #SAVE FOR /ADMIN
  end

  def create
    #SAVE FOR /ADMIN
  end

  def edit
    #SAVE FOR /ADMIN
  end

  def update
    #SAVE FOR /ADMIN
  end

  #An index view for admins only
  def index
    #SAVE FOR /ADMIN
  end

  def show
  end
  
  #Defaults to the current date
  def public_timetable
    @all_lessons = Lesson.all
    @date = Date.current
    @lessons = @all_lessons.where(date: @date).paginate(page: params[:page])
  end
  
  def search_public_timetable
    @all_lessons = Lesson.all
    @date = params[:search][:lesson_date]
    @lessons = @all_lessons.where(date: @date).paginate(page: params[:page])
  end
  
  
  private
  
    # Confirms an admin member. 
    def admin_member 
      redirect_to(root_url) unless current_member.admin? 
    end
end
