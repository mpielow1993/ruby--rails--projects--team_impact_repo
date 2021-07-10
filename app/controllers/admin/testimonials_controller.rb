class Admin::TestimonialsController < Admin::AdminApplicationController
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
    @testimonials = Testimonial.all.paginate(page: params[:page]).per_page(1)
    @testimonial = Testimonial.new
  end

  def destroy
    redirect_to admin_testimonials_path if params[:id].empty?
    @testimonial = Testimonial.find(params[:id])
    if @testimonial.destroy
      flash[:success] = 'Testimonial removed successfully'
      redirect_to admin_testimonials_path
    else
      flash[:danger] = 'An error occured removing the selected testimonial record'
      render 'admin/testimonials/new'
    end
  end

  private

    def testimonial_params
      params.require(:testimonial).permit(:first_name, :last_name, :email, :phone_no, :city, :country, :content)
    end
end
