class FacilitiesController < ApplicationController
  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.create!(facility_params)
    if @facility.save
      flash[:success] = "Facility successfully created"
    end
  end

  def edit
    #Future implementation
  end

  def update
    #Future implementation
  end

  def destroy
    #Future implementation
  end

  def index
    @facilities = Facility.all
  end

  def show
    @facility = Facility.find(params[:id])
  end
  
  private
    
    def facility_params
      params.require(:facility).permit(:name, :facility_avatar, :remove_facility_avatar)
    end
end
