# encoding: UTF-8

require 'spec_helper'

describe "welcomes/show" do
  it 'displays welcome page' do
    assign(:event, create(:event))
    render

    rendered.should have_content('1 września 2020, 10:00')
    rendered.should have_content('Aleja Kościuszki 32/7, 3. piętro')
    rendered.should have_content('Biuro Ragnarson')

    rendered.should have_selector('.map')
    rendered.should have_selector('ol.presentations')

    rendered.should have_css('li.presentation', text: 'zgłoś się do prezentacji')
  end
end
