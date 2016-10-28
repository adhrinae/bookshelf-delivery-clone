require 'spec_helper'
require_relative '../../../../apps/web/controllers/password_resets/create'

describe Web::Controllers::PasswordResets::Create do
  let(:action) { Web::Controllers::PasswordResets::Create.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
