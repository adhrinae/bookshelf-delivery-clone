module Api::Controllers::Books
  class Destroy
    include Api::Action

    def call(params)
      self.body = 'OK'
    end
  end
end
