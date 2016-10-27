class Mailers::ConfirmEmailAddress
  include Hanami::Mailer

  from    '<from>'
  to      '<to>'
  subject 'Hello'
end
