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
    @enquiry.destroy
    flash[:success] = "Enquiry removed successfully"
    redirect_to admin_enquiries_path
  end

  private

    def enquiry_params
      params.require(:enquiry).permit(:first_name, :last_name, :email, :phone_no, :message)
    end
end
