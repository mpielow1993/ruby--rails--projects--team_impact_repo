class LessonsController < ApplicationController
    before_action :logged_in_member, only: [:index, :show, :create, :new, :update, :destroy, :public_timetable, :private_timetable, :search_timetable]
  
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
  def lessons_index
    #SAVE FOR /ADMIN
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
  
  
  private
  
    # Confirms an admin member. 
    def admin_member 
      redirect_to(root_url) unless current_member.admin? 
    end
    
    def subscription_params
      params.require(:subscription).permit(:member_id, :membership_id)
    end
end
