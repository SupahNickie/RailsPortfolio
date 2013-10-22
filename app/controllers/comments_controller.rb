class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @post = @comment.post_id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post_id), notice: 'Your comment was successfully submitted for moderation.' }
        format.json { render json: post_path(@comment.post_id), status: :created, location: @post.comments }
      else
        @post = Post.find(@comment.post_id)
        format.html { render template: "posts/show" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

end
