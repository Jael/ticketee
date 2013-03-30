class Ticket < ActiveRecord::Base
  attr_accessible :title, :description, :user, :asset
  belongs_to :project
  belongs_to :user
  validates_presence_of :title, :description
  validates :description, length:{minimum: 10}
  has_attached_file :asset
end
