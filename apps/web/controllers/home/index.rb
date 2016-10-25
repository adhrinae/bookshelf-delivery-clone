module Web::Controllers::Home
  class Index
    include Web::Action
    include Web::Authentication::Skip

    def call(params)
    end
  end
end
