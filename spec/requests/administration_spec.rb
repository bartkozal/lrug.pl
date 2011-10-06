# encoding: UTF-8

require 'spec_helper'

feature 'administration panel' do
  background do
    create(:event)
    page.driver.header('Authorization', %Q{Basic #{Base64.encode64("admin:example")}})
    visit admin_path
  end

  scenario 'list events' do
    page.should have_selector('form.new_event')
    within 'ul li' do
      page.should have_content('1 września 2020, 10:00')
      page.should have_link('usuń')
    end
  end

  scenario 'create event' do
    select '30', from: 'event_planned_at_3i'
    select 'Listopad', from: 'event_planned_at_2i'
    select '2011', from: 'event_planned_at_1i'
    select '06', from: 'event_planned_at_4i'
    select '30', from: 'event_planned_at_5i'
    click_button 'zaplanuj'
    page.current_path.should == root_path
    page.should have_selector('.presentation', count: 3)
  end

  scenario 'create event fails' do
    click_button 'zaplanuj'
    page.current_path.should == admin_path
    page.should have_content("Event nie został utworzony")
  end

  scenario 'delete event' do
    click_link 'usuń'
    page.should_not have_content('1 września 2011, 10:00')
  end
end