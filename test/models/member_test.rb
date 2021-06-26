require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @member = Member.new(user_name: "Example_User_Name_1234", 
                        first_name: "example_first_name",
                        last_name: "example_last_name",
                        email: "example_email@gmail.com",
                        phone_no: "+353123456789",
                        password: "TestPass_1234",
                        password_confirmation: "TestPass_1234")
  end
  
  #Test Member Validity
  test "should_be_valid" do
    assert @member.valid?
  end
  
  #Test for presence of attributes
  test "user_name_should_be_present" do
    @member.user_name = "   "
    assert_not @member.valid?
  end
  
  test "first_name_should_be_present" do
    @member.first_name = "   "
    assert_not @member.valid?
  end
  
  test "last_name_should_be_present" do
    @member.last_name = "   "
    assert_not @member.valid?
  end
  
  test "email_should_be_present" do
    @member.email = "   "
    assert_not @member.valid?
  end
  
  test "phone_no_should_be_present" do
    @member.phone_no = "   "
    assert_not @member.valid?
  end
  
  test "password should be present (nonblank)" do 
    @member.password = @member.password_confirmation = " " * 8 
    assert_not @member.valid? 
  end 
  
  #Testing the length of attributes
  
  #Done
  test "user_name should have a min length of 8 and a max length of 40" do 
    @member.user_name = "u_Name1"
    assert_not @member.valid?
    @member.user_name = "user_Name1" * 4 + "1" 
    assert_not @member.valid? 
  end
  #Done
  test "first_name should not be too long" do 
    @member.first_name = "f" * 41 
    assert_not @member.valid? 
  end 
  #Done
  test "last_name should not be too long" do 
    @member.last_name = "l" * 51 
    assert_not @member.valid? 
  end
  #Done
  test "email should not be too long" do 
    @member.email = "e" * 189 + "@example.com" 
    assert_not @member.valid? 
  end
  #Done
  test "password should have a min length of 8 and a max length of 40 " do 
    @member.password = @member.password_confirmation = "Pwd_123" 
    assert_not @member.valid? 
    @member.password = @member.password_confirmation = "Password_1" * 4 + "1"
    assert_not @member.valid? 
  end
  
  #Done
  #A number can be prefixed with a '+' (e.g. for an international dialling code)
  test "phone_no should have min 10 digits and max 20 digits" do 
    @member.phone_no = "+" + "123456789"
    assert_not @member.valid?     
    @member.phone_no = "+" + "1234" * 5 + "1" 
    assert_not @member.valid? 
  end
  
  #Testing the validity of attributes
  
  #user_name
  test "user_name validation should accept valid user_names" do 
    valid_user_names = %w[Username1 UseR_NaME234 137459userName3 uSER45NAME USER29109201name] 
    valid_user_names.each do |valid_user_name| 
      @member.user_name = valid_user_name 
      assert @member.valid?, "#{valid_user_name.inspect} should be valid"
    end 
  end
  
  test "user_name validation should reject invalid user_names" do 
    invalid_user_names = %w[User,Name1234 U$ERname2 USERNAMEuser 1234USERNAME user123456 username USERNAME 123456789 ] 
    invalid_user_names.each do |invalid_user_name| 
      @member.user_name = invalid_user_name 
      assert_not @member.valid?, "#{invalid_user_name.inspect} should be invalid" 
    end 
  end
  
  #email
  test "email validation should accept valid addresses" do 
    valid_addresses = %w[member@example.com AnOtHeR_MEmBer@yahoo.org example.user234@foo.bar ben+jerry@baz.de] 
    valid_addresses.each do |valid_address| 
      @member.email = valid_address 
      assert @member.valid?, "#{valid_address.inspect} should be valid"
    end 
  end
  
  test "email validation should reject invalid addresses" do 
    invalid_addresses = %w[member@example,com user_at_foo.org member.first_name@example. first_name.last_name@bar_baz.com foo@bar+baz.com rich.jones@team_impact.ie ] 
    invalid_addresses.each do |invalid_address| 
      @member.email = invalid_address 
      assert_not @member.valid?, "#{invalid_address.inspect} should be invalid" 
    end 
  end
  
  #phone_no
  test "phone_no validation should accept valid phone numbers" do 
    valid_phone_nos = %w[0871234567 +441610001717 0106499939] 
    valid_phone_nos.each do |valid_phone_no| 
      @member.phone_no = valid_phone_no 
      assert @member.valid?, "#{valid_phone_no.inspect} should be valid"
    end 
  end
  
  test "phone_no validation should reject invalid phone numbers" do 
    invalid_phone_no = %w[ 087123456 44+1610001717 093847567392475862345 ] 
    invalid_phone_no.each do |invalid_phone_no| 
      @member.phone_no = invalid_phone_no 
      assert_not @member.valid?, "#{invalid_phone_no.inspect} should be invalid" 
    end 
  end
  
  #password
  test "password validation should accept valid passwords" do 
    valid_passwords = %w[ Password1 PaSsWoRd_234 137459passWord4 pA55W0RD PASS29891112word ] 
    valid_passwords.each do |valid_password| 
      @member.password = valid_password 
      @member.password_confirmation = valid_password
      assert @member.valid?, "#{valid_password.inspect} should be valid"
    end 
  end
  
  test "password validation should reject invalid passwords" do 
    invalid_passwords = %w[ Pass,Word1234 Pa$$W0rd PASSword PASSWORD1234 password1234 password PASSWORD 987654321 ] 
    invalid_passwords.each do |invalid_password| 
      @member.password = invalid_password 
      @member.password_confirmation = invalid_password
      assert_not @member.valid?, "#{invalid_password.inspect} should be invalid" 
    end 
  end
  
  #Test for uniqueness of user_names
  
  test "user_names should be unique" do 
    duplicate_member = @member.dup 
    @member.save 
    assert_not duplicate_member.valid? 
  end
  
  test "authenticated? should return false for a member with nil digest" do 
    #Using the genralised 'authenticated?' method in the user test
    assert_not @member.authenticated?(:remember, '') 
  end
  
  #Test that passwords and password confirmation should match
  
  test "password and password_confirmation should match" do
    @member.password_confirmation = "Test4321"
    @member.save
    assert_not @member.valid?
  end
  
  #Test of dependent: :destroy
  test "associated newswire posts should be destroyed" do 
    @member.save 
    @member.newswire_posts.create!(content: "Lorem ipsum") 
    assert_difference 'NewswirePost.count', -1 do 
      @member.destroy 
    end 
  end
end
