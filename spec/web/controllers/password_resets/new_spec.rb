require 'spec_helper'
require_relative '../../../../apps/web/controllers/password_resets/new'

describe Web::Controllers::PasswordResets::New do
  let(:action) { Web::Controllers::PasswordResets::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
