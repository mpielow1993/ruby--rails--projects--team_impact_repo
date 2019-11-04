class ProgrammesController < ApplicationController
  def new
    @programme = Programme.new
  end

  def create
    @programme = Programme.create!(programme_params)
    if @programme.save
      flash[:success] = "Programme successfully created"
    end  
  end

  def edit
    #Future implementation
  end

  def update
    #Future implementation
  end

  def index
    @programmes = Programme.all
  end

  def destroy
    #Future implementation
  end
  
  def show
    @programme = Programme.find(params[:id])
  end
  
  private
    
    def programme_params
      params.require(:programme).permit(:name, :programme_avatar, :remove_programme_avatar)
    end
end
