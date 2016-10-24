require 'spec_helper'
require_relative '../../../../apps/web/views/activities/index'

describe Web::Views::Activities::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/activities/index.html.erb') }
  let(:view)      { Web::Views::Activities::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
