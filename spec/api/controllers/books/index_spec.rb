require 'spec_helper'
require_relative '../../../../apps/api/controllers/books/index'

describe Api::Controllers::Books::Index do
  let(:action) { Api::Controllers::Books::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
