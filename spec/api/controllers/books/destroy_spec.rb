require 'spec_helper'
require_relative '../../../../apps/api/controllers/books/destroy'

describe Api::Controllers::Books::Destroy do
  let(:action) { Api::Controllers::Books::Destroy.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
