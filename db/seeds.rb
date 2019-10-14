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

# Generate newswire_posts and comments for a subset of members. 
members = Member.where(admin: true)
50.times do |n|
    newswire_post_content = Faker::Lorem.sentence(word_count: 5) 
    members.each { |member| member.newswire_posts.create!(content: newswire_post_content) } 
end

#newswire_posts = Member.first.newswire_posts
#10.times do 
    #comment_content = Faker::Lorem.sentence(word_count: 5) 
    #newswire_posts.each { |newswire_post| newswire_post.comments.create!(content: comment_content) } 
#end

    # Generate microposts for a subset of members. 
    #members = Member.where(admin: true)
    #50.times do 
      #  content = Faker::Lorem.sentence(word_count: 5) 
    # members.each { |member| member.newswire_posts.create!(content: content) }

#Programmes

programmes = []
programme_names = ["Boxing", "BJJ", "Fighting Fit", "Kids", "MMA", "Muay Thai", "Teens", "Wrestling", "Women", "Private Classes"]
10.times do |n|
    programme = Programme.create!( name: programme_names[n] )
    programmes.push(programme)
end

#Instructors
instructor_first_names = ["Rich", "Michael", "Ciaran", "Carrie", "Aaron", "Aaron", "Pawel", "Sean"]
instructor_last_names = ["Jones", "Prendergast", "Dempsey", "Canning", "Jennings", "Murray", "Grubinski", "Reilly"]
instructor_roles = ["Head Instructor", "MMA and BJJ Instructor", "BJJ Instructor", "Womens Instructor", 
                    "Muay Thai and MMA Instructor", "Boxing Instructor", "Wrestling Instructor", "Head Physio"]

instructors = []                    
8.times do |n|
    instructor = Instructor.create!( first_name: instructor_first_names[n], last_name: instructor_last_names[n], role: instructor_roles[n] )
    instructors.push(instructor)
end

#Facilities
facilities = []
facility_names = ["Mat Area", "MMA Area", "Boxing Area", "Gym Area", "Changing Area", "Reception Area", "Sports Therapy Area"]

7.times do |n|
    facility = Facility.create!( name: facility_names[n] )
    facilities.push(facility)
end

#Testimonials
testimonial_first_names = ["Paul", "Brandon", "Joe", "David", "Ciara", "Cormac", "Marie", "Sam", "Rachel", "Martin", "Aneta"]
testimonial_last_names = ["Casey", "Miller", "Dolan", "McKenna", "0'Brien", "McCabe", "Burgess", "Reilly", "Spade", "McAdams", "Tokarska"]
testimonial_emails = ["paul.casey12@gmail.com", "brandon.miller1@hotmail.com", "joe.dolan@yahoo.com", "david.mckenna@gmail.com",
                        "ciara_ob@sendgrid.net", "cormac1234@hotmail.com", "burgess_marie@ymsn.com", "sammyboy@gmail.com",
                        "rachel.spade234543@hotmail.com", "marty_mc@yahoo.com", "aneta4058969@gmail.com"]
testimonial_cities = ["Manchester", "Denver", "Ennis", "Ennis", "Dublin", "Berlin", "Madrid", "Copenhagen", "Cardiff", "Drogheda", "Warsaw"]
testimonial_countries = ["England", "USA", "Ireland", "Ireland", "Ireland", "Germany", "Spain", "Denmark", "Wales", "Ireland", "Poland"]

testimonial_messages = ["I flew in from Manchester on holiday visiting family in Ennis and trained here for a week. Classes were superb and everyone 
                        there could not be more welcoming. Made me and my daughter feel very welcome. Looking forward to going back!", 
                        "I just visited from the US and was very interested in checking out Team Impact. I came just in time to do the no-gi BJJ class 
                        with Michael. He was awesome to work with as even though he had a whole class to focus on, he still had time to work with me 
                        even though I was just a day pass guest. Their members are very lucky to have such a respectable gym to train at. Thank you 
                        Team Impact for the great experience! I'll definitely be back here on my next trip to Ireland! Cheers!", 
                        "Best place to train in Ireland imo. Staff are very friendly and helpful. Atmosphere is great, everybody is really friendly 
                        and approachable. Gym is open from early am to late pm which is great as classes run throughout the day. I have trained in 
                        numerous MMA gyms over the years and this one is by far the best.", 
                        "I have practiced martial arts for 26 years and can honestly say that Team Impact is the perfect mix for anyone looking to take 
                        part in martial arts. Whether a beginner or experienced practitioner, the club caters for both perfectly with a great 
                        atmosphere, great coaches and a great class schedule. Get in and get started. You'll look back and realize it was one of 
                        the best choices you've ever made.", 
                        "The quality of instructors and training at Team Impact is second to none. I have trained in other gyms but would never 
                        consider going anywhere else now!", 
                        "Train with one of the top teams in the country and be the best you can be. Rich has a wealth of knowledge and is eager to 
                        share it and the proof is easy to see. He has developed guys who have won tonnes of local, regional and international medals 
                        and titles in numerous disciplines. Being part of this team not only makes you a better fighter, it makes you a better person. 
                        In order to achieve success you will travel a journey and along the way you will find that the person who started no longer 
                        exists but instead has changed into someone extraordinary. Proud to be part of Team Impact.", 
                        "By far one of the best places I have ever trained. Everyone is friendly, accommodating and eager to make sure you learn martial 
                        arts the right way! Everyone in this gym is tough but they are some of the best people I have come across in all my travels. 
                        When I am in Ireland, this is my home! The head coach Rich Jones has a wealth of knowledge and embodies the principles of 
                        Loyalty, Honour and Respect. Great gym, great coach, great group of guys!", 
                        "I joined Team Impact to further my career in MMA and they have already helped me do that. I wish I joined sooner, Rich is 
                        a very intelligent and professional coach and all members live and breathe his ethos. Great family environment too with 
                        many parents and their children training there.", 
                        "I only came up to try one class. Five years later I'm now training full time and I wouldn't change it for the world! 
                        The atmosphere in the gym is great and classes run pretty much all day! I train Brazilian Jiu-Jitsu, Boxing, Muay Thai 
                        and Wrestling. The coaches have always been super helpful and supportive from Beginner level to where I am today! I met all 
                        of my friends through Team Impact. Joining this gym was one of the best decisions I ever made.", 
                        "The guys down in the gym couldn't be more welcoming! Before training starts you'd have no idea which fighters are pros and 
                        who's just beginning on their own journey; it's one of the few gyms where egos are truly left at the door. The training itself 
                        is as good as it gets. World-class technique. It's an honour to train at such an awesome and unique facility.", 
                        "The gym has a great atmosphere, the training is great. Each class is run by professional trainers with years of experience in 
                        combat sports. I would definitely recommend it for anyone who wants to learn self-defence :)"]

11.times do |n|
    Testimonial.create!( first_name: testimonial_first_names[n], 
                        last_name: testimonial_last_names[n], 
                        email: testimonial_emails[n],
                        city: testimonial_cities[n],
                        country: testimonial_countries[n],
                        content: testimonial_messages[n])
end

#Lessons

timetable_instructor_ids = [1, 2, 3, 4, 5, 6, 7]
timetable_facility_ids = [1, 2, 3, 4]
timetable_programme_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
timetable_levels = ["Beginner", "Intermediate", "Advanced", "Competition"]

#start_times
#timetable_start_times = []

#6.times do |n|
 #   timetable_start_times.push(Time.zone.parse("Tue 15th Oct 2019 #{n+6}am"))
#end

#timetable_start_times.push(Time.zone.parse("Tue 15th Oct 2019 12:00pm"))
#9.times do |n|
#    timetable_start_times.push(Time.zone.parse("Tue 15th Oct 2019 #{n+1}pm"))
#end

#end_times
#timetable_end_times = []
#5.times do |n|
#   timetable_end_times.push(Time.zone.parse("Tue 15th Oct 2019 #{n+7}am"))
#end
#timetable_end_times.push(Time.zone.parse("Tue 15th Oct 2019 12:00pm"))
#10.times do |n|
#    timetable_end_times.push(Time.zone.parse("Tue 15th Oct 2019 #{n+1}pm"))
#end

#Generate a random sample of lessons for a single day (Tue 15th Oct 2019)
#lessons = []
#16.times do |n|
#    lesson = Lesson.create!(start_time: timetable_start_times[n],
#                            end_time: timetable_end_times[n],
#                            instructor_id: timetable_instructor_ids[n % 7],
#                            facility_id: timetable_facility_ids[n % 4],
#                            programme_id: timetable_programme_ids[n % 10],
#                            level: timetable_levels[n % 4])
#    lessons.push(lesson)
#end

#lesson = Lesson.create!(start_time: Time.zone.parse("Tue 15th Oct 6:00am"),
#                        end_time: Time.zone.parse("Tue 15th Oct 7:00am"),
#                        instructor_id: 2,
#                        facility_id: 2,
#                        programme_id: 5,
#                        level: "Beginner")
#    lessons.push(lesson)

5.times do |n|
    Lesson.create!( date: Date.strptime("2019-10-17"),
                    start_time: Time.zone.parse("Thu 17th Oct #{n+6}:00am"),
                    end_time: Time.zone.parse("Thu 17th Oct #{n+7}:00am"),
                    instructor_id: timetable_instructor_ids[6 % (n+1)],
                    facility_id: timetable_facility_ids[3 % (n+1)],
                    programme_id: timetable_programme_ids[9 % (n+1)],
                    level: timetable_levels[3 % (n+1)])
end

Lesson.create!( date: Date.strptime("2019-10-17"),
                start_time: Time.zone.parse("Thu 17th Oct 12:00pm"),
                end_time: Time.zone.parse("Thu 17th Oct 1:00pm"),
                instructor_id: timetable_instructor_ids[3],
                facility_id: timetable_facility_ids[2],
                programme_id: timetable_programme_ids[1],
                level: timetable_levels[2])

9.times do |n|
    Lesson.create!( date: Date.strptime("2019-10-17"), 
                    start_time: Time.zone.parse("Thu 17th Oct #{n+1}:00pm"),
                    end_time: Time.zone.parse("Thu 17th Oct #{n+2}:00pm"),
                    instructor_id: timetable_instructor_ids[6 % (n+1)],
                    facility_id: timetable_facility_ids[3 % (n+1)],
                    programme_id: timetable_programme_ids[9 % (n+1)],
                    level: timetable_levels[3 % (n+1)])
end

#    lesson = Lesson.create!(start_time: timetable_start_times[n],
#                            end_time: timetable_end_times[n],
#                            instructor_id: timetable_instructor_ids[n % 7],
#                            facility_id: timetable_facility_ids[n % 4],
#                            programme_id: timetable_programme_ids[n % 10],
#                            level: timetable_levels[n % 4])
#    lessons.push(lesson)

#    lesson = Lesson.create!(start_time: timetable_start_times[n],
#                            end_time: timetable_end_times[n],
#                            instructor_id: timetable_instructor_ids[n % 7],
#                            facility_id: timetable_facility_ids[n % 4],
#                            programme_id: timetable_programme_ids[n % 10],
#                            level: timetable_levels[n % 4])
#    lessons.push(lesson)




