class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    if current_user
      @projects = policy_scope(Project)
    else
      @projects = Project.published
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end


  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  def create
    @project = Project.new(params[:project])
    authorize @project

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully added.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @project = Project.find(params[:id])
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    authorize @project

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
