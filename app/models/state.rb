class State < ActiveRecord::Base
  attr_accessible :name, :color, :background
  has_many :comments
  has_many :tickets
end
