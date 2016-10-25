require 'spec_helper'
require_relative '../../../../apps/web/controllers/session/new'

describe Web::Controllers::Session::New do
  let(:action) { Web::Controllers::Session::New.new }
  let(:valid) { Hash[session: { username: 'tester1', password: 'foobar' }] }
  let(:invalid) { Hash[session: { username: 'tester1', password: 'foobaz' }] }

  before do
    UserRepository.clear
    @user = UserRepository.create(User.new(name: 'test_user', username: 'tester1', password: BCrypt::Password.create('foobar')))
  end

  it "redirects after successful login" do
    response = action.call(valid)
    response[1]['Location'].must_equal '/'
  end

  it "redirects after failed login" do
    response = action.call(invalid)
    response[0].must_equal 401
  end
end
