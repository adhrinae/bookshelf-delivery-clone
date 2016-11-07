module Web::Views::Users
  class New
    include Web::View

    def form
      Form.new(:user, routes.users_path)
    end

    def encrypted_form
      form_for :encrypted, routes.users_path do
        hidden_field :name
        hidden_field :username
        hidden_field :email
        hidden_field :password
        hidden_field :password_confirmation
      end
    end

    def submit_label
      'Create User'
    end
  end
end
