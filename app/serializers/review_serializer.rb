class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :comment, :picture_id, :picture, :user_id, :user_name
  # belongs_to :user

  attribute :user_name do |picture|
    picture.user.name  
  end
end
