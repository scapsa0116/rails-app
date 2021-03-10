class PictureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :image_url, :description, :user_id, :user
  has_many :reviews
end
