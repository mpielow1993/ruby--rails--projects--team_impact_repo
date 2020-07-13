# README

# Introduction

This project details a back-end extension to my existing front-end website for fictional Mixed Martial Arts Gym, Team Impact (located in repository 'html--css--js--team_impact_original_static_website'). The aim of this project was to provide a centralised platform that would allow both registered members and staff (which I have equated to admins in this hypothetical scenario) to perform all necessary day-to-day operations associated with each user type. Please read on to gain further understanding of the operations that each type of user can perform.  

# Getting started
    
    a. Make sure that Ruby on Rails is installed in your local machine.
    b. To run the rails server, run 'rails server' or 'rails s' within the root directory of this project.
    c. With the server running, type 'http://localost:3000' in your browser URL.

  Before cloning this project and trying to log in initially, the 'Members' table may not be recognised. 
  If this happens, you need to migrate the database, then populate it. 
  To do this, perform the following steps:
  
    a. To migrate the database, run 'rails db:migrate' in the terminal of the project's root directory .
    b. Similarly, run 'rails db:seed to populate the database with the sample data (located in 'db/seeds.rb') '
  
# Signing up

    There should already be data seeded within the database for this prototype design, so if you don't want to sign up as a new member you can use the following details 
    to log in:
         
      a. Username: 'Ex4mple_Member_{any whole number >= 1 and <= 9}'
      b. Password: 'Member_Ex4mple'
    
    If you do want to sign up as a new basic member, perform the following steps:
    
      a. Go to 'Home'.
      b. Click 'Sign up now'.
      c. Fill out your details as instructed.
      d. You should receive a notification at the top of your screen prompting you to check your email.
      e. Go into your email account and click on the link within the email sent.
      f. Once clicked, you should be taken into the member login area and prompted that your registration was successful.
    
# Logging in as a Basic Member:
  
    a. Go to the 'Log In' section in the navigation bar.
    b. Type your username and password, then click 'Log In'
    
# Logging in as an Admin:

    a. Go to 'Log In'.
    b. Type for Username: 'Ex4mple_4dm1n_{any whole number >= 1 and <= 5}'
    c. Type for Password: '4dm1n_Ex4mple'

# Public Visitor capabilities

  Public visitors to the site (i.e. that are not logged in) can do the following;

    a. Submit an enquiry.
  
      i. Click on the 'Contact' tab within the navigation bar.
      ii. Fill out the form as instructed, then click 'Submit Enquiry'.
      iii. If the enquiry is successfully submitted, a green success notification will appear at the top of the screen saying 
           'Your enquiry was submitted successfully. Thank you.'.
  
    b. Submit a testimonial.
  
      i. Click on the 'Testimonials' tab within the navigation bar.
      ii. Fill out the form as instructed, then click 'Submit Testimonial'.
      iii. If the testimonial is successfully submitted, a green success notification will appear at the top of the screen saying 
           'Testimonial has been successfully submitted with email confirmation. Thank you'.

# Member Capabilities
  
  Member capabilites and use cases are mentioned within the context of the entities to which they relate to.
  
  Members can do the following:
  
  1. Members
  
    a. Update their own member details.
    
      i. When logged in, click on the 'Account' tab within the navigation bar, then click 'Settings'.
      ii. Make the necessary changes, then click 'Save Changes'.
      iii. If the update is successful, a green success notification will appear at the top of the screen saying 'Profile Updated'.
      
  2. Newswire Posts 
  
    a. View posts in the newswire.
    
      i. When logged in, click on 'Newswire' within the sidebar, then click 'Public'.
      
  3. Comments 
  
    a. View comments within a newswire post.
    
      i. When logged in, click on 'Newswire' within the sidebar, then click 'Public'.
      ii. Under all newswire posts, there is a link called 'Show Comments', which leads to the comment thread for that particular post.
      iii. Click on this 'Show Comments' link.
      
    b. Create their own comments.
    
      i. Within the comment thread for a particular newswire post, write text within the textarea marked 'Add Comment' and upload image/video files with the File Upload icon.
      ii. When ready to sumbit, click 'Post'.
      iii. If the comment has been posted successfully, a green success notification will appear at the top of the screen saying 'Comment Added'.
      
    c. Delete their own comments.
    
      i. Once a member's own comment is posted, a delete button will appear within that comment.
      ii. Click this 'Delete' button.
      iii. If deleted successfully, a green success notification will appear at the top of the screen saying 'Comment successfully deleted'.
      
  4. Programmes 
  
    a. View programmes currently being run.
    
      i. Click on the 'Programmes' section within the navigation bar.
      ii. Click on a specific programme to view its details.
      
  5. Instructors
  
    a. View instructors currently teaching lessons.
    
      i. Click on the 'Instructors' section within the navigation bar.
      ii. Click on a specific instructor to view their details.
      
  6. Facilities
  
    a. View facilities currently being used for lessons.
    
      i. Click on the 'Facilities' section within the navigation bar.
      ii. Click on a specific facility to view its details.
      
  7. Lessons
  
    a. View any lesson within the timetable.
    
      i. When logged in, click on 'Timetable' within the sidebar, then click 'Public'.
      ii. Click on the search bar at the top of the page. A calendar pop-up will appear.
      iii. Click on any date to search for the lessons for that day.
      
      NOTE - To view a sample list of lessons for a particular day, select any date >= 20th December 2020 and <= 29th December 2020 
      (I just used these dates for my sample data as I think they are memorable).
      
    b. Register for any lesson.
      
      Before registering for a lesson, a membership subcription needs to be purchased within the store (see 'Orders' below).
    
      i. Within the timetable for a specific day, if not already registered for a lesson, there should be a 'Register' button within each Lesson record.
      ii. Select the membership subscription that you wish to use from the drop-down list.
      iii. Click 'Register'.
      iv. If registered successfully, a green success notification will appear at the top of the lesson record saying 'Registration Successful'.
      v. This registered lesson will now appear within the personal timetable for the logged-in member on the specific day.
      vi. To view this, go to 'Timetable', then click 'Your Timetable', then select the day of the lesson that was registered for.
    
    c. Members can view all lessons that they are currently registered to.
    
      i. Go to 'Timetable', then click 'Your Timetable'.
    
    d. Unregister for any lesson
    
      i. Within either the public or personal timetable, click the 'Unregister' button for a lesson that has been registered to.
      ii. If unregistered successfully, a green success notification will appear at the top of the lesson record saying 'Deegistration Successful'.
      
  8. StoreItems
  
    a. View all products able to be ordered within the store.
      i. When logged in, go to the 'Store' section within the sidebar, then click 'Your Purchases'.
      ii. This leads to the members' store, where memberships and other products can be purchased.
    
  9. Orders
  
    a. Create new orders
    
      i. Within the members' store, click the 'New Order' button, located under the sidebar.
      ii. A green success notification will appear saying 'New order created successfully'.
      iii. Each listed store item should now display an adjustable number field and an 'Add to Cart' button.
      iv. Update your order as necessary (see below for details on how to do this).
      
      NOTE - To be able to register for lessons, it is required to purchase a subscription to at least one type of membership.
      
      v. When ready, click the 'Checkout' button at the bottom of the page showing the total contents of your current order. You can use the following details for the 
         Stripe payment gateway that appears.
      
        - Email: joebloggs@fake.io
        - Card Number: 4242 4242 4242 4242
        - Expiry Date: 11/21
        - CVV: 111  
        
      vii. If the order is completed successfully, a notification should appear at the top of the screen. This will also detail how many membership subscriptions were purchased
           in the completed order. To find out how to view all of your memberships, see 'Memberships' below.
    
    b. Update live orders.
    
      i. When a new live order is created, each listed store item displays an adjustable number field and an 'Add to Cart' button.
      ii. For a specific store item, use the number field to set the amount, then click 'Add to Cart'.
      iii. You will receive a green notification saying 'Item added successfully' and be taken to a page display the current total contents of your order.
      iv. You can update the order item that you just added on this page by adjusting its number field and clicking 'Update Cart' (from which you will receive a green 
          success notification saying 'Order Item updated successfully'), or you can click the 'Continue Shopping' button at the bottom of the page to go back to the original             store page and continue adding items to your order.
    
    c. Delete their current order.    
      i. For a current order, click the 'Delete Order' button located at the bottom of the page showing the total contents of your current order.
      ii. A confirmation alert will pop up saying 'Are you sure you want to delete this order?', to which you click 'OK' to proceed.
      ii. If your current order has been deleted successfully, a green success notification will appear saying 'Order successfully destroyed'. 
      
    d. View their Completed Orders.
      i. When logged in, Click on the 'Store' section within the sidebar, then click 'Your Purchases'.
      ii. To view full details of a specific order, click 'View Details'.
  
  10. Memberships
  
    a. View personal membership subscriptions.
      i. When logged in, go to the 'Memberships' section of the sidebar, then click 'Your Membership Subscriptions'.
      ii. To view the lessons registered to using a specific subscription, click on its associated 'View Details' link.
    
    b. Delete personal membership subscriptions.
      i. When logged in, go to the 'Memberships' section of the sidebar, then click 'Your Membership Subscriptions'.
      ii. To delete a particular membership subscription, click on the subscription record's 'Delete' button.
      iii. If the subscription is successfully deleted, a green success notification will appear at the top of the screen saying 'Subscription successfully removed'.

# Admin Capabilities

  In addition to having all of the capabilities of a base member (detailed above), admin members have the following exclusive capabilities (again, mentioned within the 
  context of the entity to which they relate).
  
  The following credentials can be used to log in as an admin:
  
    a. Type for Username: 'Ex4mple_4dm1n_{any whole number >= 1 and <= 5}'
    b. Type for Password: '4dm1n_Ex4mple'
  
  
  Admins can exclusively do the following:
  
  1. Members
  
    a. View a list of all basic members and admins. 
   
        i. When logged in as an admin, go to the 'Admin' section within the sidebar.
        ii. Click 'Search', then click 'Members'.
    
    b. Create basic members and other admins.
   
        i. When logged in as an admin, go to the 'Admin' section of the sidebar, then click 'New', then click 'Member'.
        ii. Fill out the following 'New Member' form as instructed (You can decide on whether a new member is an ordinary member or an admin by deselecting/selecting the 
        'Admin' checkbox).
        iii. When finished, click 'Create Member'.
        iv. If the member is successfully created, a green success notification will appear at the top of the screen saying 'New Member Created Successfully'.
    
    c. Update the details of basic members.
   
        i. When viewing the list of all ordinary members, click on the 'Edit' button for a particular member record.
        ii. Edit the members details within the edit form as necessary, then click 'Save Changes'.
        iii. If the member record is updated successfully, a green success notification will appear at the top of the screen saying 'Member Updated Successfully'.
    
    d. Delete ordinary members
   
        i. When viewing the list of all ordinary members, click on the 'Delete' button for a particular member record. 
        ii. An alert will appear, asking for confirmation to delete the selected member record. Click 'Yes'.
        iii. An alert confirmation will appear saying 'Are you sure you want to delete member '{deleted member's username}'?'. Click 'OK' to proceed.
        iv. If the member record is deleted successfully, a green success notification will appear at the top of the screen saying 'Member Successfully Removed'.
    
  2. NewswirePosts 
  
    a. Create their own posts in the member newswire.
    
        i. When logged in as an admin, go to the 'Newswire' section of the sidebar, then click 'Public'.
        ii. Under the sidebar, there should be a section title 'Create a Post' containing a text area (marked 'Add Newswire Post'), an image/video upload icon.
        iii. Once these facilities are utilised as necessary to build your desired post, click the 'Post' button.
        iv. If the newswire post is created successfully, a green success notification will appear at the top of the screen saying 'Newswire post created'.
    
    b. Delete their own posts in the member newswire.
    
        i. When logged in as an admin, go to the 'Newswire' section of the sidebar, then click 'Public'.
        ii. For any post that the logged-in admin has created, there should be an attached 'Delete' button. Click on this button.
        iii. An alert confirmation will appear saying 'Are you sure you want to delete this newswire post?'. Click 'OK' to proceed.
        iii. If deleted successfully, a green success notification will appear at the top of the screen saying 'Newswire post successfully deleted'.
      
  3. Comments 
  
    a. Delete the comments of any other ordinary member (but not another admin).
    
        i. When logged in as an admin, go to the 'Newswire' section of the sidebar, then click 'Public'.
        ii. Go into the comment thread of a particular newswire post by clicking the associated 'Show Comments' link for a specific post.
        iii. There should be a delete button for a comment from any member and any comment from the logged-in admin. Click on this button.
        iv. An alert confirmation will appear saying 'Are you sure you want to delete this comment?'. Click 'OK' to proceed.
        iv. If the associated comment is deleted successfully, a green success notification will appear at the top of the screen saying 'Comment Removed'.
      
  4. Programmes
   
    a. View a list of all programmes.
   
        i. When logged in as an admin, go to the 'Admin' section within the sidebar.
        ii. Click 'Search', then click 'Programmes'.
    
    b. Create new programmes.  
   
        i. When logged in as an admin, go to the 'Admin' section of the sidebar, then click 'New', then click 'Programme'.
        ii. When finished, click 'Create Programme'.
        iii. If the programme is successfully created, a green success notification will appear at the top of the screen saying 'Programme added successfully'.
    
    c. Update the details of existing programmes.
   
        i. When viewing the list of all programmes, click on the 'Edit' button for a particular Programme record.
        ii. Edit the programme's details within the edit form as necessary, then click 'Save Changes'.
        iii. If the programme record is updated successfully, a green success notification will appear at the top of the screen saying 'Programme updated successfully'.
    
    d. Delete programmes
   
        i. When viewing the list of all programmes, click on the 'Delete' button for a particular Programme record. 
        ii. An alert will appear, asking for confirmation to delete the selected Programme record. Click 'Yes'.
        iii. If the Programme record is deleted successfully, a green success notification will appear at the top of the screen saying 'Programme successfully removed'.
    
    NOTE - Each Admin capability for the 'Programme' entity and its associated procedure can be extended to the following entities:
        
        i. Instructors
        ii. Facilities
        iii. Lessons
        iv. StoreItems
      
  9. Orders
  
    a. View all completed orders placed within the system.
        i. When logged in as an admin, go to the 'Admin' section of the sidebar, then click 'Search', then click 'Orders'. 
        ii. To view details, click on the 'View Details' link for an associated order.
    
    b. Remove any completed order placed within the system.
        i. When logged in as an admin, go to the 'Admin' section of the sidebar, then click 'Search', then click 'Orders'.
        ii. A 'Delete' button should appear for each completed order record. Click on this.
        iii. An alert will appear, asking for confirmation to delete the selected Order record. Click 'Yes'.
        iv. If the Order record is deleted successfully, a green success notification will appear at the top of the screen saying 'Order successfully removed'.
      
  10. Registrations
  
    a. Unregister any base member to or from any lesson (but not other admins).
    
        i. When logged in as an admin, go to the 'Admin' section of the sidebar, then click 'Search', then click 'Lessons'.
        ii. To view the members registered for a particular lesson, click on the 'View Registrations' link of the associated Lesson record to be taken to a list of 
          all members registered for that lesson.
        iii. Click on the associated 'Unregister' button, for the member that the logged-in admin intends to unregister.
        iv. An alert will appear, asking for confirmation to delete the selected lesson registered for. Click 'Yes'.
        v. If you have unregistered successfully, a green success notification will appear at the top of the screen saying 'Deregistration successful'. 
      
  11. Enquiries
  
    a. View a list of all enquiries
    
      i. When logged in as an admin, go to the 'Admin' section of the sidebar, then click 'Search', then click 'Enquiries'.
      
    b. Delete a specific enquiry
    
      i. When viewing the list of total enquiries as an admin, each Enquiry record has an associated 'Delete' button. Click on this.
      ii. An alert will appear, asking for confirmation to delete the selected enquiry. Click 'Yes'.
      iii. If the enquiry is deleted successfully, a green success notification should appear at the top of the screen.
      
  12. Testimonials
  
    a. View a list of all testimonials
    
      i. When logged in as an admin, go to the 'Admin' section of the sidebar, then click 'Search', then click 'Testimonials'.
      
    b. Delete a specific enquiry
    
      i. When viewing the list of total enquiries as an admin, each Testimonial record has an associated 'Delete' button. Click on this.
      ii. An alert will appear, asking for confirmation to delete the selected testimonial. Click 'Yes'.
      iii. If the tetimonial is deleted successfully, a green success notification should appear at the top of the screen.
      

