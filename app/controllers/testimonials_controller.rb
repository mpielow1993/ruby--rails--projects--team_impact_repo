class TestimonialsController < ApplicationController

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    if @testimonial.save
      flash[:success] = "Testimonial has been successfully submitted with email confirmation. Thank you"
      @testimonial.send_testimonial
      redirect_to testimonials_path
    else
      flash[:success] = "An error occured submitting the testimonial"
      render 'testimonials/index'
    end
  end

  def index
    @testimonials = Testimonial.all.paginate(page: params[:page]).per_page(5)
    @testimonial = Testimonial.new
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    check_existence(@testimonial, testimonials_path, "Testimonial not found")
    if @testimonial.destroy
      flash[:success] = "Testimonial removed successfully"
      redirect_to testimonials_path
    else
      flash[:danger] = "An error occurred removing the selected testimonial. Please try again."
      redirect_to testimonials_path
    end
  end
  
  private
    
    def testimonial_params
      params.require(:testimonial).permit(:first_name, :last_name, :email, :phone_no, :city, :country, :content)
    end
end
