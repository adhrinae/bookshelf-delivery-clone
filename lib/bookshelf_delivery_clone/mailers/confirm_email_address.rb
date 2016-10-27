class Mailers::ConfirmEmailAddress
  include Hanami::Mailer

  from    'noreply@bookshelf.org'
  to      :recipient
  subject :subject

  private

  def recipient
    user.email
  end

  def subject
    "Welcome #{user.name}!"
  end

  def activation_uri
    routes.activate_path(user)
  end
end
