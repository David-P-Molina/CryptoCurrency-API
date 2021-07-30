class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :password
end
