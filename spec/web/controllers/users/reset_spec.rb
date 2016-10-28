require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/reset'

describe Web::Controllers::Users::Reset do
  let(:action) { Web::Controllers::Users::Reset.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
