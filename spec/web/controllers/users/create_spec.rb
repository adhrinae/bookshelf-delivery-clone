require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/create'

describe Web::Controllers::Users::Create do
  let(:action) { Web::Controllers::Users::Create.new }
  let(:params) { Hash[user: {name: 'foo', username: 'fooman', password: 'foobar', password_confirmation: 'foobar'}] }

  after do
    UserRepository.clear
  end

  it 'creates user with valid params' do
    action.call(params)
    action.user.id.wont_be_nil
  end

  it "hashes given password" do
    action.call(params)
    refute_equal params[:user][:password], action.user.password
  end

  it "redirects to home page" do
    response = action.call(params)
    response[1]['Location'].must_equal '/'
  end
end
