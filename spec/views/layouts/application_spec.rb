# encoding: UTF-8

require 'spec_helper'

describe 'layouts/application' do
  before do
    view.stub(current_user: nil)
    render
  end

  it "displays header" do
    rendered.should have_link('Łódź Ruby User Group', href: root_path)
  end
end
