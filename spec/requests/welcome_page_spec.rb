# encoding: UTF-8

require "spec_helper"

feature "Welcome page" do
  scenario "visit /" do
    visit '/'

    page.should have_content('Łódź Ruby User Group')

    within '.info' do
      page.should have_content('20 października 2011, 16:30')
      page.should have_content('Łąkowa 11, biuro Ragnarson, 2. piętro')
      page.should have_content('1. klatka, ceglany budynek na środku podwórka')
    end

    page.should have_selector('.map')

    within 'ol.presentations' do
      page.should have_selector('.presentation', count: 3)
      within 'li.presentation' do
        page.should have_selector('.topic')
        page.should have_selector('.author')
      end
    end

    within 'footer' do
      page.should have_content('wcześniejsze prezentacje')
      page.should have_link('kod źródłowy', href: 'https://github.com/bkzl/lrug.pl')
    end
  end
end