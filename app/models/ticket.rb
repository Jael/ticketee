class Ticket < ActiveRecord::Base
  attr_accessible :title, :description, :user, :assets_attributes 
  belongs_to :project
  belongs_to :user
  validates_presence_of :title, :description
  validates :description, length:{minimum: 10}
  has_many :assets
  has_many :comments
  belongs_to :state
  accepts_nested_attributes_for :assets
  has_and_belongs_to_many :tags
  searcher do 
    label :tag, from: :tags, field: :name 
    label :state, from: :state, field: :name
  end

  def tag!(tags)
    tags = tags.split(' ').map{ |name| Tag.find_or_create_by_name(name: name)}
    self.tags << tags
  end
end
