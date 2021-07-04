class EnquiriesController < ApplicationController
  
  def new
    @enquiry = Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      flash[:success] = "Your enquiry was submitted successfully. Thank you."
      @enquiry.send_enquiry
      redirect_to contact_path
    else
      render 'static_pages/contact'
    end
  end

  private

    def enquiry_params
      params.require(:enquiry).permit(:first_name, :last_name, :email, :phone_no, :message)
    end
end
