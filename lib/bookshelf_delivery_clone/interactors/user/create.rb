require "hanami/interactor"
require "securerandom"

class User::Create
  include Hanami::Interactor

  expose :user

  def initialize(name, username, email, password)
    password_hash = digest(password)
    @user = User.new(name: name, username: name, email: email,
                     password_digest: password_hash)
  end

  def call
    create_activation_digest
    @user = UserRepository.create(@user)
    Mailers::ConfirmEmailAddress.deliver(user: @user)
  end

  private

  def digest(string)
    BCrypt::Password.create(string)
  end

  def create_activation_digest
    @user.activation_token = new_token
    @user.activation_digest = digest(@user.activation_token)
  end

  def new_token
    SecureRandom.urlsafe_base64
  end
end
