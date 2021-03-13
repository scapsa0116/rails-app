class PictureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :image_url, :description, :user_id, :user_name
  has_many :reviews

  attribute :user_name do |picture|
    picture.user.name  
  end

  # attribute :reviews_desc do |picture|
  #   picture.reviews.comment
  # end
end
