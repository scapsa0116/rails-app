class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email 
  has_many :pictures
  # has_many :reviews


  # attribute :links do |user|
  # self: user_path.(object.id)
  # end
end


