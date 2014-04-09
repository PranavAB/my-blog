class User < ActiveRecord::Base
  include RoleModel
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
           
  validates :first_name, presence: true
  validates :last_name, presence: true  
  
  has_many :posts
  
  roles :admin, :member
  
  def name
    "#{self.first_name} #{self.last_name}"
  end
         
end
