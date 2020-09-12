class Diary < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: {maximum: 1000 }
  validates :title, presence: true, length: {maximum: 20 }
end
