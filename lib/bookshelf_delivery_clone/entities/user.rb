require "securerandom"

class User
  include Hanami::Entity
  attributes :name, :username, :email, :password_digest, :activation_token, :activation_digest,
             :activated, :reset_digest, :reset_sent_at, :created_at, :updated_at

  def books
    @books ||= BookRepository.get_books_of(self)
  end

  def authenticate(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def create_activation_digest
    self.activation_token = new_token
    self.activation_digest = digest(self.activation_token)
  end

  def authenticated?(token)
    digest = self.activation_digest
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private

  def new_token
    SecureRandom.urlsafe_base64
  end

  def digest(string)
    BCrypt::Password.create(string)
  end
end
