require 'spec_helper'
require_relative '../../../../apps/web/controllers/password_resets/edit'

describe Web::Controllers::PasswordResets::Edit do
  let(:action) { Web::Controllers::PasswordResets::Edit.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
