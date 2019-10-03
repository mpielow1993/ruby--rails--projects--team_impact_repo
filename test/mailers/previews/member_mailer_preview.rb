# Preview all emails at http://localhost:3000/rails/mailers/member_mailer
class MemberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/member_mailer/account_activation
  
  #A working preview method for account activation
  def account_activation
    member = Member.first 
    member.activation_token = Member.new_token 
    MemberMailer.account_activation(member)
  end

  # Preview this email at http://localhost:3000/rails/mailers/member_mailer/password_reset
  def password_reset
    MemberMailer.password_reset
  end

end
