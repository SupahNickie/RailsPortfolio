class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :load_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])
    authorize @comment

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Your comment was successfully submitted for moderation.' }
        format.json { render json: @commentable, status: :created, location: @commentable }
      else
        instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
        render template: "#{@resource}/show"
      end
    end
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    authorize @comment

    respond_to do |format|
      if @comment.save
        @comment.update_attributes(params[:comment])
        format.html { redirect_to @commentable, notice: 'The comment was successfully published.' }
        format.json { render json: @commentable, status: :created, location: @commentable }
      else
        instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
        render template: "#{@resource}/show"
      end
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    authorize @comment
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @commentable, notice: "The comment was successfully deleted." }
      format.json { head :no_content }
    end
  end

private

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end

end
