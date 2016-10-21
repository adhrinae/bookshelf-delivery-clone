require 'spec_helper'
require_relative '../../../../apps/api/controllers/books/update'

describe Api::Controllers::Books::Update do
  let(:action) { Api::Controllers::Books::Update.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
