class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project
  before_filter :find_ticket, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_create!, only: [:new, :create]
  before_filter :authorize_update!, only: [:edit, :update]
  before_filter :authorize_delete!, only: :destroy
  def new
    @ticket = Ticket.new
    @ticket.assets.build
  end 

  def show
    @comment = @ticket.comments.build
    @states = State.all
  end

  def create
    @ticket = @project.tickets.new(params[:ticket].merge!(user: current_user))
    if can?(:tag, @project) || current_user.admin?
      @ticket.tag!(params[:tags])
    end
    if @ticket.save
      redirect_to [@project, @ticket], notice: "Ticket has been created." 
    else
      flash[:alert] = "Ticket has not been created."
      render :new
    end
  end

  def update
    if @ticket.update_attributes(params[:ticket])
      redirect_to [@project, @ticket], notice: "Ticket has been updated."
    else
      flash[:alert] = "Ticket has not been updated."
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to @project, notice: "Ticket has been deleted."
  end

  def search
    @tickets = @project.tickets.search(params[:search])
    render "projects/show"
  end
  private
  def find_project
    @project = Project.for(current_user).find(params[:project_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking for could not be found."
    redirect_to root_path
  end

  def find_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def authorize_create!
    if !current_user.admin? && cannot?("create tickets".to_sym, @project)
      flash[:alert] = "You cannot create tickets on this project."
      redirect_to @project
    end
  end

  def authorize_update!
    if !current_user.admin? && cannot?("edit tickets".to_sym, @project)
      flash[:alert] = "You cannot edit tickets on this project."
      redirect_to @project
    end
  end

  def authorize_delete!
    if !current_user.admin? && cannot?("delete tickets".to_sym, @project)
      flash[:alert] = "You cannot delete tickets from this project."
      redirect_to @project
    end
  end
end
