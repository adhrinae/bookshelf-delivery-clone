module Web::Controllers::Books
  class Index
    include Web::Action

    expose :books

    def call(_)
      @books = BookRepository.get_books_of(current_user)
    end
  end
end
