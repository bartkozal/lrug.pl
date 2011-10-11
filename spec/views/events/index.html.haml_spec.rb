# encoding: UTF-8

require 'spec_helper'

describe "events/index.html.haml" do
  it "displays all presentations" do
    assign(:events, create_list(:event, 3))
    render

    rendered.should have_selector('.date', text: '1 września 2020')

    rendered.should have_selector('.event', count: 3)
    rendered.should have_selector('.presentation', count: 9)
  end
end
