class CommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to game_path(@game) }
      else
        format.html { redirect_to game_path(@game), notice: '投稿できませんでした' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:game_id, :content, :image, :image_cache).merge(user_id: current_user.id)
  end
end
