class BookRepository
  include Hanami::Repository

  def self.get_books_of(user)
    query do
      where(user_id: user.id)
    end.all
  end
end
