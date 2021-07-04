class ApplicationMailer < ActionMailer::Base
  default from: ENV['SENDGRID_SINGLE_SENDER_EMAIL_ADDRESS']
  layout 'mailer'
end
