class MemberMailer < ApplicationMailer

  default from: 'michaelpielow@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.account_activation.subject
  #
  
  #Mailing the account activation link
  def account_activation(member) 
    @member = member 
    mail(to: member.user_name, subject: "Account Activation") 
  end

  # Mail link to newly created member to reset their password and activate their account
  def admin_account_activation(member)
    @member = member
    mail(to: member.user_name, subject: "Admin Account Activation") 
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.password_reset.subject
  #
  #Mailing the password reset link
  def password_reset(member) 
    @member = member 
    mail(to: member.user_name, subject: "Password Reset") 
  end

end
