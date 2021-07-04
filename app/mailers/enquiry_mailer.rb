class EnquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiry_mailer.submit_enquiry.subject
  #
  def submit_enquiry(enquiry)
    @enquiry = enquiry
    mail(to: enquiry.email, subject: "Enquiry Submission")
  end
end
