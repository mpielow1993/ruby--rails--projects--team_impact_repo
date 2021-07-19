class Admin::EnquiriesController < Admin::AdminApplicationController

  def new
    @enquiry = Enquiry.new
  end

  def create
    @enquiries = Enquiry.all
    @enquiry = Enquiry.create(enquiry_params)
    if @enquiry.save
      flash[:success] = "Enquiry created successfully"
      redirect_to admin_enquiries_path
    else
      flash.now[:danger] = 'An error occurred creating the enquiry'
      render 'admin/enquiries/new'
    end
  end

  def index
    @enquiries = Enquiry.all.paginate(page: params[:page]).per_page(1)
    @enquiry = Enquiry.new
  end

  def destroy
    redirect_to admin_enquiries_path if params[:id].empty?
    @enquiry = Enquiry.find(params[:id])
    check_existence(@enquiry, admin_enquiries_path, "Member not found")
    if @enquiry.destroy
      flash[:success] = "Enquiry removed successfully"
      redirect_to admin_enquiries_path
    else
      flash.now[:danger] = "An error occurred removing this enquiry"
      render 'admin/enquiries/index'
    end
  end

  private

    def enquiry_params
      params.require(:enquiry).permit(:first_name, :last_name, :email, :phone_no, :message)
    end
end
