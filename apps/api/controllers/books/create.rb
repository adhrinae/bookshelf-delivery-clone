module Api::Controllers::Books
  class Create
    include Api::Action

    def call(params)
      self.body = 'OK'
    end
  end
end
