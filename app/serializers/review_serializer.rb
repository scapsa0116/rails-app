class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :comment, :picture_id, :picture, :user_id, :user
  # belongs_to :user
end
