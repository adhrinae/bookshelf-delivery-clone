require 'spec_helper'
require_relative '../../../../apps/web/controllers/password_resets/update'

describe Web::Controllers::PasswordResets::Update do
  let(:action) { Web::Controllers::PasswordResets::Update.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
