# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#A program for seeding the database with sample members

# Create some sample admins. 
5.times do |n|
    user_name = "Ex4mple_4dm1n_#{n+1}"
    first_name = "Example"
    last_name = "Admin #{n+1}"
    email = "example_admin@teamimpact.ie"
    phone_no = "+353123456789"
    password = "4dm1n_Ex4mple" 
    admin = true
    Member.create!( user_name: user_name,        #'create!' raises an exception for an invalid user instead of returning false
                    first_name: first_name,
                    last_name: last_name,
                    email: email,
                    phone_no: phone_no,
                    password: password, 
                    password_confirmation: password,
                    admin: true,
                    activated: true, 
                    activated_at: Time.zone.now) 
end
                
# Generate a bunch of additional regular members. 
99.times do |n|
    user_name = "Ex4mple_Member_#{n+1}" 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = "example_member_#{n+1}@teamimpact.ie"
    phone_no = "0941234567"
    password = "Member_Ex4mple" 
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

# Generate microposts for a subset of members. 
members = Member.where(admin: true)
50.times do 
    content = Faker::Lorem.sentence(word_count: 5) 
    members.each { |member| member.newswire_posts.create!(content: content) } 
end