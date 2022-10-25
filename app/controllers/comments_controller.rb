class CommentsController < ApplicationController

 

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
    redirect_to prototype_path(@comment.prototype)
    else 
    @prototype = @comment.prototype
    @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user,prototype_id: params[:prototype_id])
  end
end

