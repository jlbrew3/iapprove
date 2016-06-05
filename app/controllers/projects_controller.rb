class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @user = User.find(current_user.id)
  end

  def my_projects
    @user = User.find(current_user.id)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    @project.notes = params[:notes]
    @project.project_status = params[:project_status]
    @project.favorite_style = params[:favorite_style]
    @project.budget = params[:budget]
    @project.room_type = params[:room_type]
    @project.project_name = params[:project_name]

    if @project.save
      redirect_to "/my_projects", :notice => "Project created successfully."
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    @project.notes = params[:notes]
    @project.project_status = params[:project_status]
    @project.favorite_style = params[:favorite_style]
    @project.budget = params[:budget]
    @project.room_type = params[:room_type]
    @project.project_name = params[:project_name]

    if @project.save
      redirect_to "/my_projects", :notice => "Project updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])

    @project.destroy

    redirect_to "/my_projects", :notice => "Project deleted."
  end
end
