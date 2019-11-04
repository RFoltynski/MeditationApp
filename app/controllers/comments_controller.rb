class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_meditation, only: %i[create edit update destroy]
  before_action :find_comment, only: %i[edit update destroy]
  def create
    @comment = @meditation.comments.create(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to meditation_path(@meditation)
      flash[:notice] = 'Komentarz dodany..'
    else
      redirect_to meditation_path(@meditation)
      flash[:notice] = 'Komentarz nie został dodany..'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to meditation_path(@meditation)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to meditation_path(@meditation)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_meditation
    @meditation = Meditation.find(params[:meditation_id])
  end

  def find_comment
    @comment = @meditation.comments.find(params[:id])
  end
end
