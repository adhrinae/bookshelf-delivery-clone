require 'spec_helper'

describe Mailers::PasswordReset do
  it 'delivers email' do
    mail = Mailers::PasswordReset.deliver
  end
end
