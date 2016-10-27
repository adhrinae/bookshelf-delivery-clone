require 'spec_helper'

describe Mailers::ConfirmEmailAddress do
  it 'delivers email' do
    mail = Mailers::ConfirmEmailAddress.deliver
  end
end
