module Api::Controllers::Books
  class Index
    include Api::Action

    expose :books

    def call(_)
      books = BookRepository.all
      hashes = books.map { |book| Api::Representers::Book.new(book).to_hash }

      self.status = 200
      self.body = { books: hashes }.to_json
    end
  end
end
