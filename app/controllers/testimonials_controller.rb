class TestimonialsController < ApplicationController
  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.build(testimonial_params)
  end

  def edit
  end

  def update
  end

  def index
    @testimonial = Testimonial.all
  end

  def destroy
  end
  
  def show
    @testimonial = Testimonial.find(params[:id])
  end
  
  private
    
    def testimonial_params
      params.require(:testimonial).permit(:first_name, :last_name, :email, :phone_no, :city, :country)
    end
end
