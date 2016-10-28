module Web::Controllers::PasswordResets
  class New
    include Web::Action
    include Web::Authentication::Skip

    def call(params)
    end
  end
end
