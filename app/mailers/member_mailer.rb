class MemberMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.account_activation.subject
  #
  
  #Mailing the account activation link
  def account_activation(member) 
    @member = member 
    mail to: member.email, 
    subject: "Account Activation" 
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.password_reset.subject
  #
  #Mailing the password reset link
  def password_reset(member) 
    @member = member 
    mail to: member.email, 
    subject: "Password Reset" 
  end
end
