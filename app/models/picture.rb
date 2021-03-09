class Picture < ApplicationRecord
  belongs_to :user
  has_many :revievs
  # has_many :users, through: :reviews
end
