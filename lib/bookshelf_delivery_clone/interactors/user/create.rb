require "hanami/interactor"

class User::Create
  include Hanami::Interactor

  expose :user

  def initialize(name, username, password)
    encrypted_password = BCrypt::Password.create(password)
    @user = User.new(name: name, username: name, password: encrypted_password)
  end

  def call
    @user = UserRepository.create(@user)
  end
end
