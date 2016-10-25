module Web::Views::Home
  class Index
    include Web::View

    def login_form
      form_for :session, routes.login_path, class: 'ui form' do
        div class: 'field' do
          label :username
          text_field :username
        end

        div class: 'field' do
          label :password
          password_field :password
        end

        submit 'Login', class: 'ui button'
      end
    end

    def greeting(current_user)
      "Hello, #{current_user.name}!"
    end
  end
end
