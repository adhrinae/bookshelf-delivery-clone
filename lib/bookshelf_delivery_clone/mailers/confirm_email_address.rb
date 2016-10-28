class Mailers::ConfirmEmailAddress
  include Hanami::Mailer

  from    'noreply@bookshelf.org'
  to      :recipient
  subject :subject

  def activation_uri
    Web::Routes.url(:activate, token: user.activation_token, email: user.email)
  end

  private

  def recipient
    user.email
  end

  def subject
    "Welcome #{user.name}!"
  end
end
