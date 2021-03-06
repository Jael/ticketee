class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_ticket
  def create
    if cannot?(:"change states", @ticket.project)
      params[:comment].delete(:state_id)
    end
    @comment = @ticket.comments.new(params[:comment].merge(user: current_user))
    if can?(:tag, @ticket.project) || current_user.admin?
      @ticket.tag!(params[:tags])
    end
    if @comment.save
      redirect_to [@ticket.project, @ticket], notice: "Comment has been created."
    else
      @states = State.all
      flash[:alert] = "Comment has not been created."
      render 'tickets/show'
    end
  end

  private
  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
