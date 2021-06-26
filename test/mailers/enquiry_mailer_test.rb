require 'test_helper'

class EnquiryMailerTest < ActionMailer::TestCase
  test "submit_enquiry" do
    mail = EnquiryMailer.submit_enquiry
    assert_equal "Submit enquiry", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
