# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#A program for seeding the database with sample members

# Create a main sample member. 
Member.create!( user_name: "Ex4mple_Member",
                first_name: "Example",
                last_name: "Member",
                email: "example_member@teamimpact.ie",
                phone_no: "+353123456789",
                password: "Password_1", 
                password_confirmation: "Password_1",
                admin: true,
                activated: true, 
                activated_at: Time.zone.now) 
                
# Generate a bunch of additional members. 
99.times do |n|
    user_name = "Ex4mple_Member_#{n+1}" 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = "example_member_#{n+1}@teamimpact.ie"
    phone_no = "0941234567"
    password = "Password_2" 
    Member.create!( user_name: user_name,        #'create!' raises an exception for an invalid user instead of returning false
                    first_name: first_name,
                    last_name: last_name,
                    email: email,
                    phone_no: phone_no,
                    password: password, 
                    password_confirmation: password,
                    activated: true, 
                    activated_at: Time.zone.now)
end