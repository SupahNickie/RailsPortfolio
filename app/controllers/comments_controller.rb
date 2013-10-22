class CommentsController < ApplicationController
  before_filter :load_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Your comment was successfully submitted for moderation.' }
        format.json { render json: @commentable, status: :created, location: @post.comments }
      else
        format.html { render template: "home/index" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

end
