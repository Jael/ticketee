class Ticket < ActiveRecord::Base
  attr_accessible :title, :description
  belongs_to :project
  validates_presence_of :title, :description
  validates :description, length:{minimum: 10}
end
