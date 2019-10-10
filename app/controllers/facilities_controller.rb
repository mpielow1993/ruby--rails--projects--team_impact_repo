class FacilitiesController < ApplicationController
  def new
    #Future implementation
  end

  def create
    #Future implementation
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
end
