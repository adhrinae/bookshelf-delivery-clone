require 'spec_helper'
require_relative '../../../../apps/web/views/users/create'

describe Web::Views::Users::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/create.html.erb') }
  let(:view)      { Web::Views::Users::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
