require 'spec_helper'
require_relative '../../../../apps/api/controllers/books/create'

describe Api::Controllers::Books::Create do
  let(:action) { Api::Controllers::Books::Create.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
