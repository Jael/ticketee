class Comment < ActiveRecord::Base
  attr_accessible :text, :user, :state_id
  after_create :set_ticket_state
  
  belongs_to :ticket
  belongs_to :user
  belongs_to :state
  validates_presence_of :text
  delegate :project, to: :ticket

  private 
    def set_ticket_state
      self.ticket.state = state
      ticket.save!
    end
end
