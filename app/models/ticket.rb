class Ticket < ActiveRecord::Base
  attr_accessible :title, :description, :user, :assets_attributes 
  belongs_to :project
  belongs_to :user
  validates_presence_of :title, :description
  validates :description, length:{minimum: 10}
  has_many :assets
  has_many :comments
  accepts_nested_attributes_for :assets
end
