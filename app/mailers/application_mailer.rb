class ApplicationMailer < ActionMailer::Base
  default from: '<SENDGRID_SINGLE_SENDER_EMAIL_ADDRESS>'
  layout 'mailer'
end
