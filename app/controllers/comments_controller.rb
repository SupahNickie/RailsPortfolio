class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @post = @comment.post
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Your comment was successfully submitted for moderation.' }
        format.json { render json: @post, status: :created, location: @post.comments }
      else
        format.html { render template: "posts/show" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

end
