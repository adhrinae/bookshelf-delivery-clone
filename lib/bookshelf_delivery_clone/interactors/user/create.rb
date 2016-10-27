require "hanami/interactor"

class User::Create
  include Hanami::Interactor

  expose :user

  def initialize(name, username, email, password)
    password_hash = digest(password)
    @user = User.new(name: name, username: name, email: email,
                     password_digest: password_hash)
  end

  def call
    @user.create_activation_digest
    @user = UserRepository.create(@user)
    Mailers::ConfirmEmailAddress.deliver(user: @user)
  end

  private

  def digest(string)
    BCrypt::Password.create(string)
  end
end
