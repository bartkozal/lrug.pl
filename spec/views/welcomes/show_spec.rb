# encoding: UTF-8

require 'spec_helper'

describe "welcomes/show" do
  it 'displays welcome page' do
    assign(:event, create(:event))
    render

    rendered.should have_content('1 września 2020, 10:00')
    rendered.should have_content('Łąkowa 11, biuro Ragnarson, 1. piętro')
    rendered.should have_content('Budynek główny (ceglany), 1. klatka')

    rendered.should have_selector('.map')
    rendered.should have_selector('ol.presentations')

    rendered.should have_css('li.presentation', text: 'zgłoś się do prezentacji')
  end
end
