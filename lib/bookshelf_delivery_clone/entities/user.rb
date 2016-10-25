class User
  include Hanami::Entity
  attributes :name, :username, :password

  def authenticate(password)
    BCrypt::Password.new(self.password) == password
  end
end
