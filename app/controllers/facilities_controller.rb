class FacilitiesController < ApplicationController
  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.create!(facility_params)
    if @facility.save
      flash[:success] = "Facility successfully created"
      redirect_to facilities_path
    else
      render 'new'
    end
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    @facility.update(facility_params)
    if @facility.save
      flash[:success] = "Facility successfully updated"
      redirect_to facility_path(@facility)
    else
      render 'edit'
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    flash[:success] = "Facility successfully destroyed"
    redirect_to facilities_path
  end

  def index
    @facilities = Facility.all
  end

  def show
    @facility = Facility.find(params[:id])
    @facility_description_url = "app/views/facilities/_#{replace_char(@facility.name.downcase, " ", "_")}.html.erb"
  end
  
  private
    
    def facility_params
      params.require(:facility).permit(:name, :facility_avatar, :remove_facility_avatar)
    end
end
