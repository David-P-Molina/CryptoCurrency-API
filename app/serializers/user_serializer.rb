class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :password #:wallet ##User's wallet
end
