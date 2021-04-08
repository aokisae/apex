class Message < ApplicationRecord
    
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 2000 }
  
  has_many :images
  accepts_nested_attributes_for :images
  
end
