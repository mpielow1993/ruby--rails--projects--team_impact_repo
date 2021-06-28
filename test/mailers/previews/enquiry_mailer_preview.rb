# Preview all emails at http://localhost:3000/rails/mailers/enquiry_mailer
class EnquiryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/enquiry_mailer/submit_enquiry
  def submit_enquiry
    EnquiryMailer.submit_enquiry
  end

end
