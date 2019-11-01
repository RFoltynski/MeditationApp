class CommentsController < ApplicationController
  def index
  end

  def create
    @meditation = Meditation.find(params[:meditation_id])
    @comment = @meditation.comments.create(comment_params)

    @comment.user_id = current_user.id

    if @comment.save 
      redirect_to meditation_path(@meditation)
    else 
      render 'new'
    end
  end

  private 
  def comment_params
    params.require(:comment).permit(:content)
  end
end
