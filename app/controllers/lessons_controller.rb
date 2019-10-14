class LessonsController < ApplicationController
    before_action :logged_in_member, :admin_member, only: [:index, :show, :create, :new, :update, :destroy]
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def index
    @member = Member.find(params[:id])
    @lessons = Lesson.all.paginate(page: params[:page]).per_page(20)
  end

  def show
  end
  
  private
  
    # Confirms the correct member. 
    #def correct_member 
      #@member = Member.find(params[:id]) 
      #redirect_to(root_url) unless current_member?(@member)
    #end
  
    # Confirms an admin member. 
    def admin_member 
      redirect_to(root_url) unless current_member.admin? 
    end
end
