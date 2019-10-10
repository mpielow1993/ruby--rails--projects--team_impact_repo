class TestimonialMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.testimonial_mailer.submit_testimonial.subject
  #
  def submit_testimonial(testimonial)
    @testimonial = testimonial

    mail to: testimonial.email,
    subject: "Testimonial Submission"
  end
end
