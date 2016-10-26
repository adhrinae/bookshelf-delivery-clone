class User
  include Hanami::Entity
  attributes :name, :username, :password

  def books
    @books ||= BookRepository.get_books_of(self)
  end

  def authenticate(password)
    BCrypt::Password.new(self.password) == password
  end
end
