class User < ApplicationRecord
    has_many :pictures
    has_many :reviewed_pictures, through: :reviews, source: :picture
    # has_secure_password
end
