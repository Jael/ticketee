class State < ActiveRecord::Base
  attr_accessible :name, :color, :background, :default
  has_many :comments
  has_many :tickets

  def default!
    current_default_state = State.find_by_default(true)
    self.default = true
    self.save!
    if current_default_state
      current_default_state.default = false
      current_default_state.save!
    end
  end
end
