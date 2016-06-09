class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @user = User.find(current_user.id)
  end

  def my_projects
    @projects = Project.all
    @user = User.find(current_user.id)
  end

  def accept
    designer_owner = Ownership.new
    designer_owner.project_id = params[:id]
    designer_owner.user_id = current_user.id
    designer_owner.save

    project_in_question = Project.find(params[:id])
    project_in_question.project_status = "Active"
    project_in_question.save

    redirect_to "/my_projects", :notice => "Project accepted."
  end

  def mark_complete
    project_in_question = Project.find(params[:id])
    project_in_question.project_status = "Completed"
    project_in_question.save

    redirect_to "/my_projects", :notice => "Project marked as completed."
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
      redirect_to "/my_projects", :notice => "Project requested successfully."
      client_owner = Ownership.new
      client_owner.project_id = @project.id
      client_owner.user_id = current_user.id
      client_owner.save
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
