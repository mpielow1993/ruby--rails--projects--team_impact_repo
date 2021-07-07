class CommentsController < ApplicationController
  before_action :logged_in_member
  before_action :correct_member, only: :private_index

  def create
    @member = Member.find(params[:comment][:member_id])
    @newswire_post = NewswirePost.find(params[:newswire_post_id])
    @comments = @newswire_post.comments.paginate(page: params[:page]).per_page(5)
    @comment = @member.comments.build(content: params[:comment][:content], newswire_post_id: params[:newswire_post_id])
    #@comment = current_member.comments.where(newswire_post_id: @newswire_post.id).build(comment_params)
    @comment.image.attach(params[:comment][:image])
    flash = {}
    if @comment.save
      flash[:success] = "Comment Added"
      redirect_to newswire_post_path(@newswire_post)
    else
      flash[:danger] = "An error occurred adding your comment"
      render 'newswire_posts/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment successfully deleted"
    redirect_to request.referrer || newswire_url
  end

  def private_index
    @member = Member.find(params[:member_id])
    @comments = @member.comments.all.paginate(page: params[:page]).per_page(5)
  end

  private

    def comment_params
      params.permit(:newswire_post_id).require(:comment).permit(:content, :image, :member_id)
    end
end
