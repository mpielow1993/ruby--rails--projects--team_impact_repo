class NewswirePostsController < ApplicationController
    before_action :logged_in_member
    before_action :correct_member, :admin_member, only: [:index, :create, :destroy]
    
    
    def index
        @member = Member.find(params[:member_id])
        #Show the admin's own posts
        @newswire_posts = @member.newswire_posts.paginate(page: params[:page])
        @newswire_post = NewswirePost.new
        
        #@newswire_post defined to allow the current logged in user to create a new micropost
        #@newswire_post = @member.newswire_posts.build #if current_member.admin?
        
        #THE PROBLEM LIES WITHIN THE ASSOCIATION ABOVE - LOOK UP ASSOCIATIONS FOR NESTED RESOURCES
    end
    
    def create
        @newswire_posts = NewswirePost.all.paginate(page: params[:page])
        @member = Member.find(params[:member_id])
        @newswire_post = @member.newswire_posts.build(newswire_post_params)
        @newswire_post.image.attach(params[:newswire_post][:image])
        if @newswire_post.save 
            flash[:success] = "Newswire post created!" 
            redirect_to newswire_url 
        else 
            render 'static_pages/newswire' 
        end
    end

    def destroy
        @member = Member.find(params[:member_id])
        @newswire_post = @member.newswire_posts.find(params[:id])
        @newswire_post.destroy 
        flash[:success] = "Newswire post successfully deleted" 
        redirect_to request.referrer || newswire_url    #refers to root_url
    end
    
    private
    
        def newswire_post_params 
            params.require(:newswire_post).permit(:content, :image) 
        end
    
        #Before filters
  
        # Confirms the correct member. 
        def correct_member 
            @member = Member.find(params[:member_id]) 
            redirect_to(root_url) unless current_member?(@member)
        end
  
        # Confirms an admin member. 
        def admin_member 
            redirect_to(root_url) unless current_member.admin? 
        end
    
end
