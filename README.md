# README

Before cloning this project and trying to log in initially, you may need to migrate the database, then populate it.
1. To migrate the database, in the terminal of the project directory run 'rails db:migrate'.
2. Similarly, to populate the database with the sample data (located in 'db/seeds.rb') run 'rails db:seed'

#Public visitor capabilities

1. Submit an enquiry.
2. Submit a testimonial.

#Member Capabilities

1. Sign up as a new member
2. Log in as a new member.
3. Comment on a newswire post (made by an admin).
4. Purchase a membership or other store product.
5. Register for a class and add to their personal timetable.
6. View their current membership subscriptions and the lessons they have used them to register for.
7. View orders purchased.

  Admins can perform the following manipulations for each entity.
  1. Members
    - Admins can create, update and delete ordinary members.
    - Admins can view a list of all ordinary members and admins 
    - Admins can visit the profiles of any ordinary member (but not other admins).
    - Admins can update their own member details (but not other admins).
  2. Newswire Posts 
    - Admins can create and delete their own posts in the member newswire.
  3. Comments 
    - Admins can create and delete comments on posts from themselves and any other ordinary member (but not another admin).
  4. Programmes - Create, Update, Delete
    - Admins can create, update, and delete any programme that the gym currently offers.
  5. Instructors - Create, Update, Delete
    - Admins can create, update and delete any instructor currently available to teach a lesson.
  6. Facilities - Create, Update, Delete
    - Admins can create, update and delete any facility currently available to use for a lesson
  7. Lessons - Create, Update, Delete
    - Admins can create, update and delete any lesson currently scheduled at the gym.
  8. StoreItems - Create, Update, Delete
    - Admins can create, update and delete any product currently for sale in the gym's online store.
  9. Orders - Create, Update, Delete
    - Admins can place 
  10. OrderItems - Create, Update, Delete
  11. Registrations (for a lesson) - Create, Delete
  12. Enquiries - Create, Delete
  13. Testimonials - Create, Delete

#Admin

  # Admin Privileges
  
  Admins can perform the following manipulations for each entity.
  1. Members - Create, Update, Delete
  2. Newswire Posts - Create, Delete
  3. Comments - Create, Delete
  4. Programmes - Create, Update, Delete
  5. Instructors - Create, Update, Delete
  6. Facilities - Create, Update, Delete
  7. Lessons - Create, Update, Delete
  8. StoreItems - Create, Update, Delete
  9. Orders - Create, Update, Delete
  10. OrderItems - Create, Update, Delete
  11. Registrations (for a lesson) - Create, Delete
  12. Enquiries - Create, Delete
  13. Testimonials - Create, Delete

Log in as an Admin:

  1. Go to 'Log In'.
  2. Type for Username: 'Ex4mple_4dm1n_{any whole number >= 1 and <= 5}'
  3. Type for Password: '4dm1n_Ex4mple'



Log in as an ordinary member:

  1. Repeat Step 1 from above.
  2. Type for Username: 'Ex4mple_4dm1n_{any whole number >= 1 and <= 9}'
  3. Type for Password: 'Member_Ex4mple'



View sample lessons that can be registered/ unregistered from in Public or Personal Timetable:

  1. When logged in, in the sidebar select 'Timetable', then 'Public'.
  2. Click on the sole search bar in this page. A calendar should display.
  3. Click on any date >= 20th December 2020 and <= 29th December 2020 (I just used these dates for my sample data as I think they are memorable).
  4. When you register/ unregister for a class on a specific date, your personal timetable will adjust accordingly.



You can only register for a lesson if you have first purchased at least one membership. To do this, follow the steps below:

  1. When logged in, in the sidebar select 'Store', then 'Public', then 'New Order'.
  2. Select any amount of memberships/ other items that you wish.
  3. When you are ready to purchase, click 'Checkout'. You can use the following sample details to complete your purchase.
  
    - Email: joebloggs@fake.io
    - Card Number: 4242 4242 4242 4242
    - Expiry Date: 11/21
    - CVV: 111
    
  4. Once you have purchased a membership (technically a subscription to a specfic type of membership), you should observe the following:
  
    - When you go into the Public Timetable (between the range of dates stated above), if you did not have any membership subscriptions previously, 
      there should now be an option to register for classes using the membership subscription(s) that you just purchased.
