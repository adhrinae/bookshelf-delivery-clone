require 'spec_helper'
require_relative '../../../../apps/web/controllers/session/new'

describe Web::Controllers::Session::New do
  let(:action) { Web::Controllers::Session::New.new }
  let(:params) { Hash[] }

  before do
    @user = User.new(name: 'foo', username: 'bar', password: Bcrypt::Password.create("foobar"))
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
