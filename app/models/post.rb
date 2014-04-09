class Post < ActiveRecord::Base
  
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  validates :title, presence: true,
                    length: { minimum: 5 }
                    
  max_paginates_per 100
  paginates_per 10
end
