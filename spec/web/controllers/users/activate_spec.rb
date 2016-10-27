require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/activate'

describe Web::Controllers::Users::Activate do
  let(:action) { Web::Controllers::Users::Activate.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
