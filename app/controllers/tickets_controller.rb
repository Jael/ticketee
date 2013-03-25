class TicketsController < ApplicationController
  before_filter :find_project
  before_filter :find_ticket, only: [:show, :edit, :update, :destroy]
  def new
    @ticket = Ticket.new
  end 

  def create
    @ticket = @project.tickets.new(params[:ticket])
    if @ticket.save
      redirect_to [@project, @ticket], notice: "Ticket has been created." 
    else
      flash[:alert] = "Ticket has not been created."
      render :new
    end
  end


  private
  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end