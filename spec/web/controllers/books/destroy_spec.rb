require 'spec_helper'
require_relative '../../../../apps/web/controllers/books/destroy'

describe Web::Controllers::Books::Destroy do
  let(:action) { Web::Controllers::Books::Destroy.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
