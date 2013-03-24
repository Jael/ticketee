class ProjectsController < ApplicationController
  def index
  end 
  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
    redirect_to @project, flash: {success: "Project has been created."}
    else
      flash[:alert] = "Project has not been created."
      render :new 
    end

  end
end
