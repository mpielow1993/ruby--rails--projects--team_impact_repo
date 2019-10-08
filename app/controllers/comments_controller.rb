require 'allowable'

class CommentsController < ApplicationController
  #before_action :set_newswire_post_id_param, only: :create
  def show
    @member = Member.find(params[:member_id])
    @newswire_post = @member.newswire_posts.find(params[:newswire_post_id]) 
    @comment = @newswire_post.comments.find(params[:id])
  end

  def create
    @member = Member.find(params[:member_id])
    @newswire_post = @member.newswire_posts.find(params[:id])
    @comments = @newswire_post.comments.paginate(page: params[:page]).per_page(5)
    #@comment = @newswire_post.comments.build(comment_params)
    @comment = current_member.comments.where(newswire_post_id: @newswire_post.id).build(comment_params)
    @comment.image.attach(params[:comment][:image])
    if @comment.save
      flash[:success] = "Comment Added" 
      redirect_to member_newswire_post_comments_path(@member, @newswire_post) 
    else 
      render 'comments/index' 
    end
  end

  def destroy
    @member = Member.find(params[:member_id])
    @newswire_post = @member.newswire_posts.find(params[:newswire_post_id])
    @comment = @newswire_post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment successfully deleted" 
    redirect_to request.referrer || member_newswire_post_comments_path(@member, @newswire_post)
  end
  
  def index
    @member = Member.find(params[:member_id])
    @newswire_post = @member.newswire_posts.find(params[:newswire_post_id])
    @comments = @newswire_post.comments.all.paginate(page: params[:page]).per_page(5)
    #@comment.build(newswire_post_id: @newswire_post.id)
    @comment = current_member.comments.where(newswire_post_id: @newswire_post.id).build
        
    #Remember why you only use 'only:' in the routes - I need to route this page to a 'new' action that will do the form for me
    #Do I need to route the same page to both controllers?
  end
  
  private
    
    def comment_params
      params.require(:comment).permit(:content, :image)
    end
end
