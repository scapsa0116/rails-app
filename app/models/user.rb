class User < ApplicationRecord
    has_many :pictures
    has_many :reviews
    has_many :reviewed_pictures, through: :reviews, source: :picture
    has_secure_password
    validates_presence_of :name
    validates_presence_of :email
    validates_uniqueness_of :email




    # def self.from_omniauth(auth)
    #     where(email: auth.info.email).first_or_initialize do |user|
    #       user.name = auth.info.name
    #       user.email = auth.info.email
    #       user.password = SecureRandom.hex
    #     end
    #   end
end
