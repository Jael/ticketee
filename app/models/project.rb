class Project < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  has_many :tickets, dependent: :destroy
  has_many :permissions, as: :thing
  scope :readable_by, lambda{|user|
    joins(:permissions).where(:permissions => { :action => "view", :user_id => user.id})}
end

