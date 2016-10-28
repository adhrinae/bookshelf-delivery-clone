require 'spec_helper'
require_relative '../../../../apps/web/views/password_resets/new'

describe Web::Views::PasswordResets::New do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/password_resets/new.html.erb') }
  let(:view)      { Web::Views::PasswordResets::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
