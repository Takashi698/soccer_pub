class CommentsController < ApplicationController
  before_action :set_game, only: %i(create edit update destroy)

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(permitted_parameter)
    respond_to do |format|
      if @comment.save
        # format.html { redirect_to game_path(@game) }
        format.js { render :index }
      else
        format.html { redirect_to game_path(@game), notice: '投稿できませんでした' }
      end
    end
  end

  def edit
    @comment = @game.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメント編集中'
      format.js{ render :edit }
    end
  end

  def update
    @comment = @game.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(permitted_parameter)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index}
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = "コメントが削除されました"
      format.js { render :index }
    end
  end

  private
  def set_game
    @game = Game.find(params[:game_id])
  end
  def permitted_parameter
    params.require(:comment).permit(:game_id, :content, :image, :image_cache).merge(user_id: current_user.id)
  end
end
