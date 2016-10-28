class Mailers::PasswordReset
  include Hanami::Mailer

  from    'noreply@bookshelf.org'
  to      :recipient
  subject "Reset your password"

  def reset_uri
    Web::Routes.url(:edit_password_reset, id: user.reset_token, email: user.email)
  end

  private

  def recipient
    user.email
  end
end
