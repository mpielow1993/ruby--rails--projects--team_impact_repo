require 'test_helper'

class MemberMailerTest < ActionMailer::TestCase
  
  #A test of the current email implementation
  
  test "account_activation" do
    member = members(:michael) 
    member.activation_token = Member.new_token
    mail = MemberMailer.account_activation(member)
    assert_equal "Account Activation", mail.subject
    assert_equal [member.email], mail.to
    assert_equal ["noreply@teamimpact.ie"], mail.from
    assert_match member.first_name, mail.body.encoded 
    assert_match member.activation_token, mail.body.encoded 
    assert_match CGI.escape(member.email), mail.body.encoded
  end

  test "password_reset" do
    member = members(:michael)
    member.reset_token = Member.new_token
    mail = MemberMailer.password_reset(member)
    assert_equal "Password Reset", mail.subject
    assert_equal [member.email], mail.to
    assert_equal ["noreply@teamimpact.ie"], mail.from
    assert_match member.reset_token, mail.body.encoded
    assert_match CGI.escape(member.email), mail.body.encoded
  end
end
