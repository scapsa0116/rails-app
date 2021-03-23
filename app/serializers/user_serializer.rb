class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name 
  # has_many :pictures
  # has_many :reviews


  # attribute :links do |user|
  # self: user_path.(object.id)
  # end
end


# attribute :user_name do |picture|
#   picture.user.name  
# end