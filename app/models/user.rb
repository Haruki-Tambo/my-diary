class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 50}
    validates :name, length: {minimum: 4}
    validates :name, uniqueness: true
    has_secure_password
    
    has_many :diaries
end
