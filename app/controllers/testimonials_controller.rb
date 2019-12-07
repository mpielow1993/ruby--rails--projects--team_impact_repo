class TestimonialsController < ApplicationController
  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonials = Testimonial.all
    @testimonial = Testimonial.create(testimonial_params)
    if @testimonial.save
      flash[:success] = "Testimonial has been successfully submitted with email confirmation. Thank you"
      @testimonial.send_testimonial
      redirect_to testimonials_path
    else
      render 'testimonials/index'
    end
  end

  def index
    @testimonials = Testimonial.all.paginate(page: params[:page]).per_page(5)
    @testimonial = Testimonial.new
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy
    flash[:success] = "Testimonial removed successfully"
    redirect_to testimonials_path
  end
  
  private
    
    def testimonial_params
      params.require(:testimonial).permit(:first_name, :last_name, :email, :phone_no, :city, :country, :content)
    end
end
