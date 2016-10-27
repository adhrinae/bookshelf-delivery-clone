class User
  include Hanami::Entity
  attributes :name, :username, :email, :password_digest, :activation_digest, :activation_token,
             :activated, :reset_digest, :reset_sent_at, :created_at, :updated_at

  def books
    @books ||= BookRepository.get_books_of(self)
  end

  def authenticate(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end
