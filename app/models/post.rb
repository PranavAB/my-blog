class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
    
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  validates :title, presence: true,
                    length: { minimum: 5 }
                    
  max_paginates_per 100
  paginates_per 10
end
