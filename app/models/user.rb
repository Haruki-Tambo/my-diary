class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 50}
    validates :name, length: {minimum: 6}
    validates :name, uniqueness: true
    validates :password, length: {minimum: 6}
    has_secure_password
    
    has_many :diaries
end
