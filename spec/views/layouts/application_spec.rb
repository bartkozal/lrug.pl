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

  it "displays footer" do
    rendered.should have_link('wcześniejsze prezentacje', href: events_path)
    rendered.should have_link('kod źródłowy', href: 'https://github.com/bkzl/lrug.pl')
  end
end
