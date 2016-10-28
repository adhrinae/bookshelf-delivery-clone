require 'spec_helper'
require_relative '../../../../apps/web/views/users/reset'

describe Web::Views::Users::Reset do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/reset.html.erb') }
  let(:view)      { Web::Views::Users::Reset.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
