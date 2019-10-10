class ProgrammesController < ApplicationController
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

  def index
    @programmes = Programme.all
  end

  def destroy
    #Future implementation
  end
  
  def show
    @programme = Programme.find(params[:id])
  end
end
