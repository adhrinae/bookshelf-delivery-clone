module Api::Controllers::Books
  class Update
    include Api::Action

    def call(params)
      self.body = 'OK'
    end
  end
end
