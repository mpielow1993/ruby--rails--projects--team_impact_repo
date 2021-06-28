class NewswirePostsController < ApplicationController
    before_action :logged_in_member
    before_action :correct_member, only: :private_index
    before_action :admin_member, only: [:create, :destroy]



    def private_index
        @member = Member.find(params[:member_id])
        @newswire_posts = @member.newswire_posts.paginate(page: params[:page])
    end

    def public_index
        @member = current_member
        @newswire_posts = NewswirePost.all.paginate(page: params[:page])
        @newswire_post = NewswirePost.new
    end

    def create
        @member = current_member
        @newswire_post = @member.newswire_posts.build(newswire_post_params)
        @newswire_post.image.attach(params[:newswire_post][:image])
        if @newswire_post.save
            flash[:success] = "Newswire post created!"
            redirect_to newswire_path
        else
            render 'newswire_posts/public_index'
        end
    end

    def destroy
        @newswire_post = NewswirePost.find(params[:id])
        @newswire_post.destroy
        flash[:success] = "Newswire post successfully deleted"
        redirect_to newswire_path
    end

    def show
        @newswire_post = NewswirePost.find(params[:id])
        @comments = @newswire_post.comments.paginate(page: params[:page])
        @comment = current_member.comments.build
    end

    private

        def newswire_post_params
            params.require(:newswire_post).permit(:content, :image)
        end
end
