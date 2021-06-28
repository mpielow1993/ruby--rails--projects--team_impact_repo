require 'test_helper'

class TestimonialMailerTest < ActionMailer::TestCase
  test "submit_testimonial" do
    mail = TestimonialMailer.submit_testimonial
    assert_equal "Submit testimonial", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
