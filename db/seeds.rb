# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# A program for seeding the database with sample members

include ApplicationHelper

# Create some sample admins.
5.times do |n|
  user_name = "Ex4mple_4dm1n_#{n + 1}"
  first_name = 'Example'
  last_name = "Admin #{n + 1}"
  email = 'example_admin@teamimpact.ie'
  phone_no = '+353123456789'
  password = '4dm1n_Ex4mple'
  Member.create!(user_name: user_name, # 'create!' raises an exception for an invalid user instead of returning false
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
9.times do |n|
  user_name = "Ex4mple_Member_#{n + 1}"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example_member_#{n + 1}@teamimpact.ie"
  phone_no = '0941234567'
  password = 'Member_Ex4mple'
  Member.create!(user_name: user_name, # 'create!' raises an exception for an invalid user instead of returning false
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
50.times do |_n|
  newswire_post_content = Faker::Lorem.sentence(word_count: 5)
  members.each { |member| member.newswire_posts.create!(content: newswire_post_content) }
end

# newswire_posts = Member.first.newswire_posts
# 10.times do
# comment_content = Faker::Lorem.sentence(word_count: 5)
# newswire_posts.each { |newswire_post| newswire_post.comments.create!(content: comment_content) }
# end

# Generate microposts for a subset of members.
# members = Member.where(admin: true)
# 50.times do
#  content = Faker::Lorem.sentence(word_count: 5)
# members.each { |member| member.newswire_posts.create!(content: content) }

# Programmes
#programmes = []
programme_names = ['Boxing', 'BJJ', 'Fighting Fit', 'Kids', 'MMA', 'Muay Thai', 'Teens', 'Wrestling', 'Women', 'Private Classes']
10.times do |n|
  Programme.create!(
    name: programme_names[n],
    programme_avatar: Pathname.new(Rails.root.join("app/assets/images/programmes_images/Programmes_#{replace_char(programme_names[n], " ", "_")}.jpg")).open
  )#programme.save
  #programmes.push(programme)
end

# Instructors
instructor_first_names = %w[Rich Michael Ciaran Carrie Aaron Aaron Pawel Sean]
instructor_last_names = %w[Jones Prendergast Dempsey Canning Jennings Murray Grubinski Reilly]
instructor_roles = ['Head Instructor', 'MMA and BJJ Instructor', 'BJJ Instructor', 'Womens Instructor',
    'Muay Thai and MMA Instructor', 'Boxing Instructor', 'Wrestling Instructor', 'Head Physio']

#instructors = []
8.times do |n|
  Instructor.create!(
    first_name: instructor_first_names[n],
    last_name: instructor_last_names[n],
    role: instructor_roles[n],
    instructor_avatar: Pathname.new(Rails.root.join("app/assets/images/instructors_images/#{instructor_first_names[n]}_#{instructor_last_names[n]}.jpg")).open
  )
  #instructor.save
  #instructors.push(instructor)
end

# Facilities
#facilities = []
facility_names = ['Mat Area', 'MMA Area', 'Boxing Area', 'Gym Area', 'Changing Area', 'Reception Area', 'Sports Therapy Area']

7.times do |n|
  Facility.create!(
    name: facility_names[n],
    facility_avatar: Pathname.new(Rails.root.join("app/assets/images/facilities_images/#{replace_char(facility_names[n], " ", "_")}.jpg")).open
  )
  #facility.save
  #facilities.push(facility)
end

# Testimonials
testimonial_first_names = %w[Paul Brandon Joe David Ciara Cormac Marie Sam Rachel Martin Aneta]
testimonial_last_names = ['Casey', 'Miller', 'Dolan', 'McKenna', "0'Brien", 'McCabe', 'Burgess', 'Reilly', 'Spade', 'McAdams', 'Tokarska']
testimonial_emails = ['paul.casey12@gmail.com', 'brandon.miller1@hotmail.com', 'joe.dolan@yahoo.com', 'david.mckenna@gmail.com',
      'ciara_ob@sendgrid.net', 'cormac1234@hotmail.com', 'burgess_marie@ymsn.com', 'sammyboy@gmail.com',
      'rachel.spade234543@hotmail.com', 'marty_mc@yahoo.com', 'aneta4058969@gmail.com']
testimonial_cities = %w[Manchester Denver Ennis Ennis Dublin Berlin Madrid Copenhagen Cardiff Drogheda Warsaw]
testimonial_countries = %w[England USA Ireland Ireland Ireland Germany Spain Denmark Wales Ireland Poland]

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
  Testimonial.create!(first_name: testimonial_first_names[n],
      last_name: testimonial_last_names[n],
      email: testimonial_emails[n],
      city: testimonial_cities[n],
      country: testimonial_countries[n],
      content: testimonial_messages[n])
end

# Lessons
timetable_instructor_ids = [1, 2, 3, 4, 5, 6, 7]
timetable_facility_ids = [1, 2, 3, 4]
timetable_programme_ids = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
timetable_levels = %w[Beginner Intermediate Advanced Competition]

8.times do |n|
  5.times do |m|
    instructor_index = rand(0..6)

    # 6:00am - 11:00am

    case instructor_index

    # Switch statement helps to create Lessons with appropriate instructors and facilities. These associations aren't strictly enforced
    # as validations, but would be convention

    when (0..1)

      facility_index = rand(0..1)

      case facility_index
      when 0
        # Create BJJ lessons with instructors Rich Jones & Michael Prendergast. BJJ takes place in the Mat Area.
        Lesson.create!(
          date: Date.strptime("2020-12-2#{n}"),
          start_time: Time.zone.parse("2020-12-2#{n} #{m + 6}:00am"),
          end_time: Time.zone.parse("2020-12-2#{n} #{m + 7}:00am"),
          instructor_id: timetable_instructor_ids[instructor_index],
          facility_id: timetable_facility_ids[facility_index],
          programme_id: timetable_programme_ids[1],
          level: timetable_levels[rand(0..3)]
        )
      when 1
        # Create MMA lessons with instructors Rich Jones & Michael Prendergast. MMA takes place in the MMA Area.
        Lesson.create!(
          date: Date.strptime("2020-12-2#{n}"),
          start_time: Time.zone.parse("2020-12-2#{n} #{m + 6}:00am"),
          end_time: Time.zone.parse("2020-12-2#{n} #{m + 7}:00am"),
          instructor_id: timetable_instructor_ids[instructor_index],
          facility_id: timetable_facility_ids[facility_index],
          programme_id: timetable_programme_ids[4],
          level: timetable_levels[rand(0..3)]
        )
      else
        lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
      end # Match case - line 184

    when 2

      facility_index = 0

      # Create BJJ Lessons with instructor Ciaran Dempsey.
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} #{m + 6}:00am"),
        end_time: Time.zone.parse("2020-12-2#{n} #{m + 7}:00am"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[1],
        level: timetable_levels[rand(0..3)]
      )

    when 3

      facility_index = rand(0..2)

      # Create Womens' lessons with instructor Carrie Canning. Womens' classes take place anywhere
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} #{m + 6}:00am"),
        end_time: Time.zone.parse("2020-12-2#{n} #{m + 7}:00am"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[8],
        level: timetable_levels[rand(0..3)]
      )

    when 4

      facility_index = rand(1..2)

      case facility_index

      when 1

        # Create MMA lessons with instructors Aaron Jennings. MMA takes place in the MMA Area.
        Lesson.create!(
          date: Date.strptime("2020-12-2#{n}"),
          start_time: Time.zone.parse("2020-12-2#{n} #{m + 6}:00am"),
          end_time: Time.zone.parse("2020-12-2#{n} #{m + 7}:00am"),
          instructor_id: timetable_instructor_ids[instructor_index],
          facility_id: timetable_facility_ids[facility_index],
          programme_id: timetable_programme_ids[4],
          level: timetable_levels[rand(0..3)])

      when 2

        # Create Muay Thai lessons with instructors Aaron Jennings. Muay Thai takes place in the Boxing Area.
        Lesson.create!(
          date: Date.strptime("2020-12-2#{n}"),
          start_time: Time.zone.parse("2020-12-2#{n} #{m + 6}:00am"),
          end_time: Time.zone.parse("2020-12-2#{n} #{m + 7}:00am"),
          instructor_id: timetable_instructor_ids[instructor_index],
          facility_id: timetable_facility_ids[facility_index],
          programme_id: timetable_programme_ids[5],
          level: timetable_levels[rand(0..3)]
        )

      else
        lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
      end # Match case - line 237

    when 5

      facility_index = 2

      # Create Boxing lessons with instructor Aaron Murray. Boxing takes place in the Boxing Area
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} #{m + 6}:00am"),
        end_time: Time.zone.parse("2020-12-2#{n} #{m + 7}:00am"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[0],
        level: timetable_levels[rand(0..3)]
      )

    when 6

      facility_index = 0

      # Create Wrestling lessons with instructor Pawel Grubinski. Wrestling takes place in the Mat Area
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} #{m + 6}:00am"),
        end_time: Time.zone.parse("2020-12-2#{n} #{m + 7}:00am"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[7],
        level: timetable_levels[rand(0..3)]
      )
    else
      lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
    end # Match case - line 175
  end # Match do - line 169

  # 11:00am - 12:00pm

  instructor_index = rand(0..6)

  case instructor_index

  # Repeat

  when (0..1)

    facility_index = rand(0..1)

    case facility_index

    when 0

      # Create BJJ lessons with instructors Rich Jones & Michael Prendergast. BJJ takes place in the Mat Area.
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} 11:00am"),
        end_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[1],
        level: timetable_levels[rand(0..3)]
      )
    when 1

      # Create MMA lessons with instructors Rich Jones & Michael Prendergast. MMA takes place in the MMA Area.
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} 11:00am"),
        end_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[4],
        level: timetable_levels[rand(0..3)]
      )
    else
      lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
    end # Match case - line 306

  when 2

    facility_index = 1

    # Create BJJ Lessons with instructor Ciaran Dempsey.
    Lesson.create!(
      date: Date.strptime("2020-12-2#{n}"),
      start_time: Time.zone.parse("2020-12-2#{n} 11:00am"),
      end_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
      instructor_id: timetable_instructor_ids[instructor_index],
      facility_id: timetable_facility_ids[facility_index],
      programme_id: timetable_programme_ids[1],
      level: timetable_levels[rand(0..3)]
    )

  when 3

    facility_index = rand(0..2)

    # Create Womens' lessons with instructor Carrie Canning. Womens' classes take place anywhere
    Lesson.create!(
      date: Date.strptime("2020-12-2#{n}"),
      start_time: Time.zone.parse("2020-12-2#{n} 11:00am"),
      end_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
      instructor_id: timetable_instructor_ids[instructor_index],
      facility_id: timetable_facility_ids[facility_index],
      programme_id: timetable_programme_ids[8],
      level: timetable_levels[rand(0..3)]
    )

  when 4

    facility_index = rand(1..2)

    case facility_index

    when 1

      # Create MMA lessons with instructors Aaron Jennings. MMA takes place in the MMA Area.
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} 11:00am"),
        end_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[4],
        level: timetable_levels[rand(0..3)]
      )

    when 2

      # Create Muay Thai lessons with instructors Aaron Jennings. Muay Thai takes place in the Boxing Area.
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} 11:00am"),
        end_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[5],
        level: timetable_levels[rand(0..3)]
      )

    else
      lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
    end # Match case - line 362

  when 5

    facility_index = 2

    # Create Boxing lessons with instructor Aaron Murray. Boxing takes place in the Boxing Area
    Lesson.create!(
      date: Date.strptime("2020-12-2#{n}"),
      start_time: Time.zone.parse("2020-12-2#{n} 11:00am"),
      end_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
      instructor_id: timetable_instructor_ids[instructor_index],
      facility_id: timetable_facility_ids[facility_index],
      programme_id: timetable_programme_ids[0],
      level: timetable_levels[rand(0..3)]
    )

  when 6

    facility_index = 0

    # Create Wrestling lessons with instructor Pawel Grubinski. Wrestling takes place in the Mat Area
    Lesson.create!(
      date: Date.strptime("2020-12-2#{n}"),
      start_time: Time.zone.parse("2020-12-2#{n} 11:00am"),
      end_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
      instructor_id: timetable_instructor_ids[instructor_index],
      facility_id: timetable_facility_ids[facility_index],
      programme_id: timetable_programme_ids[7],
      level: timetable_levels[rand(0..3)]
    )
  else
    lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
  end # Match case - line 298

  # 12:00pm - 1:00pm

  instructor_index = rand(0..6)

  case instructor_index

  # Repeat

  when (0..1)

    facility_index = rand(0..1)

    case facility_index

    when 0

      # Create BJJ lessons with instructors Rich Jones & Michael Prendergast. BJJ takes place in the Mat Area.
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
        end_time: Time.zone.parse("2020-12-2#{n} 1:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[1],
        level: timetable_levels[rand(0..3)]
      )
    when 1

      # Create MMA lessons with instructors Rich Jones & Michael Prendergast. MMA takes place in the MMA Area.
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
        end_time: Time.zone.parse("2020-12-2#{n} 1:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[4],
        level: timetable_levels[rand(0..3)]
      )
    else
      lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
    end # Match case - line 429

  when 2

    facility_index = 1

    # Create BJJ Lessons with instructor Ciaran Dempsey.
    Lesson.create!(
      date: Date.strptime("2020-12-2#{n}"),
      start_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
      end_time: Time.zone.parse("2020-12-2#{n} 1:00pm"),
      instructor_id: timetable_instructor_ids[instructor_index],
      facility_id: timetable_facility_ids[facility_index],
      programme_id: timetable_programme_ids[1],
      level: timetable_levels[rand(0..3)]
    )

  when 3

    facility_index = rand(0..2)

    # Create Womens' lessons with instructor Carrie Canning. Womens' classes take place anywhere
    Lesson.create!(
      date: Date.strptime("2020-12-2#{n}"),
      start_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
      end_time: Time.zone.parse("2020-12-2#{n} 1:00pm"),
      instructor_id: timetable_instructor_ids[instructor_index],
      facility_id: timetable_facility_ids[facility_index],
      programme_id: timetable_programme_ids[8],
      level: timetable_levels[rand(0..3)]
    )

  when 4

    facility_index = rand(1..2)

    case facility_index

    when 1

      # Create MMA lessons with instructors Aaron Jennings. MMA takes place in the MMA Area.
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
        end_time: Time.zone.parse("2020-12-2#{n} 1:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[4],
        level: timetable_levels[rand(0..3)]
      )

    when 2

      # Create Muay Thai lessons with instructors Aaron Jennings. Muay Thai takes place in the Boxing Area.
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
        end_time: Time.zone.parse("2020-12-2#{n} 1:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[5],
        level: timetable_levels[rand(0..3)]
      )

    else
      lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
    end # Match case- line 485

  when 5

    facility_index = 2

    # Create Boxing lessons with instructor Aaron Murray. Boxing takes place in the Boxing Area
    Lesson.create!(
      date: Date.strptime("2020-12-2#{n}"),
      start_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
      end_time: Time.zone.parse("2020-12-2#{n} 1:00pm"),
      instructor_id: timetable_instructor_ids[instructor_index],
      facility_id: timetable_facility_ids[facility_index],
      programme_id: timetable_programme_ids[0],
      level: timetable_levels[rand(0..3)]
    )

  when 6

    facility_index = 0

    # Create Wrestling lessons with instructor Pawel Grubinski. Wrestling takes place in the Mat Area
    Lesson.create!(
      date: Date.strptime("2020-12-2#{n}"),
      start_time: Time.zone.parse("2020-12-2#{n} 12:00pm"),
      end_time: Time.zone.parse("2020-12-2#{n} 1:00pm"),
      instructor_id: timetable_instructor_ids[instructor_index],
      facility_id: timetable_facility_ids[facility_index],
      programme_id: timetable_programme_ids[7],
      level: timetable_levels[rand(0..3)]
    )
  else
    lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
  end # Match case - line 421

  # 1:00pm - 10:00pm

  9.times do |m|
    instructor_index = rand(0..6)

    case instructor_index

    # Switch statement helps to create Lessons with appropriate instructors and facilities. These associations aren't strictly enforced
    # as validations, but would be convention

    when (0..1)

      facility_index = rand(0..1)

      case facility_index

      when 0

        # Create BJJ lessons with instructors Rich Jones & Michael Prendergast. BJJ takes place in the Mat Area.
        Lesson.create!(
          date: Date.strptime("2020-12-2#{n}"),
          start_time: Time.zone.parse("2020-12-2#{n} #{m + 1}:00pm"),
          end_time: Time.zone.parse("2020-12-2#{n} #{m + 2}:00pm"),
          instructor_id: timetable_instructor_ids[instructor_index],
          facility_id: timetable_facility_ids[facility_index],
          programme_id: timetable_programme_ids[1],
          level: timetable_levels[rand(0..3)]
        )
      when 1

        # Create MMA lessons with instructors Rich Jones & Michael Prendergast. MMA takes place in the MMA Area.
        Lesson.create!(
          date: Date.strptime("2020-12-2#{n}"),
          start_time: Time.zone.parse("2020-12-2#{n} #{m + 1}:00pm"),
          end_time: Time.zone.parse("2020-12-2#{n} #{m + 2}:00pm"),
          instructor_id: timetable_instructor_ids[instructor_index],
          facility_id: timetable_facility_ids[facility_index],
          programme_id: timetable_programme_ids[4],
          level: timetable_levels[rand(0..3)]
        )
      else
        lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
      end # Match case - line 555

    when 2

      facility_index = 1

      # Create BJJ Lessons with instructor Ciaran Dempsey.
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} #{m + 1}:00pm"),
        end_time: Time.zone.parse("2020-12-2#{n} #{m + 2}:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[1],
        level: timetable_levels[rand(0..3)]
      )

    when 3

      facility_index = rand(0..2)

      # Create Womens' lessons with instructor Carrie Canning. Womens' classes take place anywhere
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} #{m + 1}:00pm"),
        end_time: Time.zone.parse("2020-12-2#{n} #{m + 2}:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[8],
        level: timetable_levels[rand(0..3)]
      )

    when 4

      facility_index = rand(1..2)

      case facility_index

      when 1

        # Create MMA lessons with instructors Aaron Jennings. MMA takes place in the MMA Area.
        Lesson.create!(
          date: Date.strptime("2020-12-2#{n}"),
          start_time: Time.zone.parse("2020-12-2#{n} #{m + 1}:00pm"),
          end_time: Time.zone.parse("2020-12-2#{n} #{m + 2}:00pm"),
          instructor_id: timetable_instructor_ids[instructor_index],
          facility_id: timetable_facility_ids[facility_index],
          programme_id: timetable_programme_ids[4],
          level: timetable_levels[rand(0..3)]
        )

      when 2

        # Create Muay Thai lessons with instructors Aaron Jennings. Muay Thai takes place in the Boxing Area.
        Lesson.create!(
          date: Date.strptime("2020-12-2#{n}"),
          start_time: Time.zone.parse("2020-12-2#{n} #{m + 1}:00pm"),
          end_time: Time.zone.parse("2020-12-2#{n} #{m + 2}:00pm"),
          instructor_id: timetable_instructor_ids[instructor_index],
          facility_id: timetable_facility_ids[facility_index],
          programme_id: timetable_programme_ids[5],
          level: timetable_levels[rand(0..3)]
        )

      else
        lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
      end # Match case - line 611

    when 5

      facility_index = 2

      # Create Boxing lessons with instructor Aaron Murray. Boxing takes place in the Boxing Area
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} #{m + 1}:00pm"),
        end_time: Time.zone.parse("2020-12-2#{n} #{m + 2}:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[0],
        level: timetable_levels[rand(0..3)]
      )

    when 6

      facility_index = 0

      # Create Wrestling lessons with instructor Pawel Grubinski. Wrestling takes place in the Mat Area
      Lesson.create!(
        date: Date.strptime("2020-12-2#{n}"),
        start_time: Time.zone.parse("2020-12-2#{n} #{m + 1}:00pm"),
        end_time: Time.zone.parse("2020-12-2#{n} #{m + 2}:00pm"),
        instructor_id: timetable_instructor_ids[instructor_index],
        facility_id: timetable_facility_ids[facility_index],
        programme_id: timetable_programme_ids[7],
        level: timetable_levels[rand(0..3)]
      )
    else
      lesson.errors.add(:base, 'Invalid instructor, programme and facility combination')
    end # Match case - line 546
  end # Match do - line 544
end # Match do - line 168

# Memberships
membership_names = ['Day Pass', '5-Class Pass', '10-Class Pass', 'Full Membership']
membership_descriptions = ['Unlimited classes for one day, total cost paid up-front',
           '5 classes over unlimited days, total cost paid up-front',
           '10 classes over unlimited days, total cost paid up-front',
           'Unlimited classes for a month, total cost paid up-front']
prices = [20.00, 40.00, 70.00, 100.00]
#store_item_avatars = []
4.times do |n|
  Membership.create!(
    name: membership_names[n],
    description: membership_descriptions[n],
    price: prices[n],
    store_item_avatar: Pathname.new(Rails.root.join('app/assets/images/default_images/TIFavicon2.jpg')).open
    #store_item_avatar: 'app/assets/images/default_images/TIFavicon2.jpg'
  )
end

# StoreItems (other types apart from Memberships - for now generically named 'NonMemberships')
store_item_types = %w[Membership NonMembership]
store_item_names = []
store_item_descriptions = []
store_item_prices = []
#store_item_avatars = []

4.times do |_n|
  store_item_name = Faker::Lorem.word
  store_item_names.push(store_item_name)

  store_item_description = Faker::Lorem.sentence(word_count: 10)
  store_item_descriptions.push(store_item_description)

  store_item_price = rand(1..10)
  store_item_prices.push(store_item_price)

  #store_item_avatars.push(store_item_avatar)
end

4.times do |n|
  store_item_avatar = 'app/assets/images/default_images/TIFavicon2.jpg'
  StoreItem.create!(
    type: store_item_types[1],
    name: store_item_names[n],
    description: store_item_descriptions[n],
    price: store_item_prices[n],
    store_item_avatar: store_item_avatar
  )
  #store_item.save
end

# Subscriptions

# Satisfy the unique subscription index (i.e no matching pairs for member_id & membership_id)
member_ids = (1..Member.count).to_a
membership_ids = (1..Membership.count).to_a

sample_sub_array = [member_ids, membership_ids]

# Creates unique Cartesian product pairs
subscription_arrays = sample_sub_array.combination(2).flat_map { |a, b| a.product(b) }.sort

subscription_arrays.each do |subscription_array|
  # Generates a random index in subscription_arrays
  # sub_index = rand(0..(subscription_arrays.length - 1))

  # Generates nil or a random date up to a year in the future from the current date
  #random_date_or_nil = [nil, Date.today + rand(365)]
  #sample_random_date_or_nil = random_date_or_nil[rand(0..1)]

  # random_membership_id = rand(1..4)

  Subscription.create!(
    member_id: subscription_arrays[subscription_arrays.find_index(subscription_array)][0],
    membership_id: subscription_arrays[subscription_arrays.find_index(subscription_array)][1]
  )
end

# Orders

#new_orders = []

# OrderItems

store_item_ids = (1..StoreItem.count).to_a
#order_ids = (1..Order.count).to_a

20.times do |_n|
  # Generates a random index in member_ids
  random_member_id_index = rand(1..Member.count)
  random_member = Member.find(random_member_id_index)

  new_order = random_member.orders.build(is_paid: false) # add sub_total & total

  new_order.save

  5.times do |_m|
    random_store_item_id = rand(0..(StoreItem.count - 1))
    # random_order_id = rand(0..(n - 1))   #The number of orders there will be
    random_quantity = rand(1..4)
    order_item = new_order.order_items.build(
      store_item_id: store_item_ids[random_store_item_id],
      quantity: random_quantity
    )
    # unit_price: StoreItem.find_by(id: random_store_item_id).price.to_d)
    # sub_total: (unit_price) * (random_quantity).to_d)
    # new_order.order_items.push(order_item)
    order_item.save
  end
end

#sample_order_item_array = [store_item_ids, order_ids]

# Create 10 registrations for each lesson

# Satisfy the unique registration index (i.e no matching pairs for member_id & lesson_id)
member_ids = (1..Member.count).to_a
lesson_ids = (1..Lesson.count).to_a

sample_reg_array = [member_ids, lesson_ids]

# Creates unique Cartesian product pairs
registration_arrays = sample_reg_array.combination(2).flat_map { |a, b| a.product(b) }.sort # Verified unique
registration_arrays.each do |registration_array|
  #reg_index = rand(0..(registration_arrays.length - 1))

  member = Member.find(registration_arrays[registration_arrays.find_index(registration_array)][0])

  random_subscription = member.subscriptions[rand(0..(member.subscriptions.length - 1))]

  if random_subscription.is_active
    Registration.create!(
      lesson_id: registration_arrays[registration_arrays.find_index(registration_array)][1],
      subscription_id: random_subscription.id,
      member_id: random_subscription.member_id
    )
  end
end
