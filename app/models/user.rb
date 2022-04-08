class User < ApplicationRecord
    validates :username, length: {minimum: 3, maximum: 25}, 
                        uniqueness: { case_sensitive: false }, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :username, length: {maximum: 105}, presence: true, 
                         uniqueness: { case_sensitive: false },
                         format: {with: VALID_EMAIL_REGEX }
end
