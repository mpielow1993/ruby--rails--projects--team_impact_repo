class Admin::TestimonialsController < Admin::AdminApplicationController
  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonials = Testimonial.all
    @testimonial = Testimonial.create(testimonial_params)
    if @testimonial.save
      @testimonial.send_testimonial
      flash[:success] = "Testimonial has been successfully submitted with email confirmation. Thank you"
      redirect_to testimonials_path
    else
      flash.now[:danger] = "An error occurred submitting this testimonial. Please try again"
      render 'admin/testimonials/index'
    end
  end

  def index
    @testimonials = Testimonial.all.paginate(page: params[:page]).per_page(1)
    @testimonial = Testimonial.new
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    check_existence(@testimonial, admin_testimonials_path, "Testimonial not found")
    if @testimonial.destroy
      flash[:success] = 'Testimonial removed successfully'
      redirect_to admin_testimonials_path
    else
      flash.now[:danger] = 'An error occured removing the selected testimonial record'
      render 'admin/testimonials/index'
    end
  end

  private

    def testimonial_params
      params.require(:testimonial).permit(:first_name, :last_name, :email, :phone_no, :city, :country, :content)
    end
end
