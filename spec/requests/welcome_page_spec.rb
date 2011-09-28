# encoding: UTF-8

require "spec_helper"

feature "Welcome page" do
  scenario "visit /" do
    visit '/'
    page.should have_css('header h1', text: 'Łódź Ruby User Group')
    page.should have_css('ul#presentations')
    page.should have_css('#address p', text: 'Łąkowa 11, biuro Ragnarson')
    page.should have_css('#date p', text: '20 października 2011, 16:30+')
    page.should have_css('footer p', text: 'archiwum lrug | kod źródłowy')
  end
end