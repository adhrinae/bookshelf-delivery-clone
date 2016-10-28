module Web::Views::PasswordResets
  class Edit
    include Web::View

    def password_reset_form
      form_for :user, routes.password_reset_path(id: user.id), method: :patch, class: 'ui form' do
        hidden_field :email, value: user.email

        div class: 'field' do
          label :password
          password_field :password
        end

        div class: 'field' do
          label :password_confirmation
          password_field :password_confirmation
        end

        submit 'Reset password', class: 'ui button'
      end
    end
  end
end
