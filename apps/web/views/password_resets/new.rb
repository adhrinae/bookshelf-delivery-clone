module Web::Views::PasswordResets
  class New
    include Web::View

    def email_form
      form_for :password_reset, routes.password_resets_path, class: 'ui form' do
        div class: 'field' do
          label :email
          text_field :email
        end

        submit 'Submit', class: 'ui button'
      end
    end
  end
end
