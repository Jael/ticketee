class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, 
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable 
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :tickets, dependent: :destroy
<<<<<<< HEAD
  has_many :permissions
=======
  has_many :permissions  
>>>>>>> 6ba6e4d2e70eec81a92e2ca8e8a6de3a70f935e3
  def to_s
    "#{email}(#{admin? ? "Admin" : "User"})"
  end

end
