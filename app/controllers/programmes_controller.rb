class ProgrammesController < ApplicationController
  def new
    @programme = Programme.new
  end

  def create
    @programme = Programme.create!(programme_params)
    if @programme.save
      flash[:success] = "Programme successfully created"
      redirect_to programmes_path
    else
      render 'new'
    end
  end

  def edit
    @programme = Programme.find(params[:id])
  end

  def update
    @programme = Programme.find(params[:id])
    @programme.update(programme_params)
    if @programme.save
      flash[:success] = "Programme successfully updated"
      redirect_to programme_path(@programme)
    else
      render 'edit'
    end
  end

  def index
    @programmes = Programme.all
  end

  def destroy
    @programme = Programme.find(params[:id])
    @programme.destroy
    flash[:success] = "Programmme successfully destroyed"
    redirect_to programmes_path
  end
  
  def show
    @programme = Programme.find(params[:id])
    @programme_description_url = "app/views/programmes/_#{replace_char(@programme.name.downcase, " ", "_")}.html.erb"
  end
  
  private
    
    def programme_params
      params.require(:programme).permit(:name, :programme_avatar, :remove_programme_avatar)
    end
end
