require "hanami/interactor"

class User::Create
  include Hanami::Interactor

  expose :user

  def initialize(name, username, password)
    password_hash = BCrypt::Password.create(password)
    @user = User.new(name: name, username: name, password: password_hash)
  end

  def call
    @user = UserRepository.create(@user)
  end
end
