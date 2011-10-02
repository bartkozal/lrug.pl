# encoding: UTF-8

require 'spec_helper'

feature 'administration panel' do
  scenario 'list events' do
    create(:event)
    visit admin_path
    page.should have_selector('form.new_event')
    within 'ul li' do
      page.should have_content('1 września 2011, 10:00')
      page.should have_link('usuń')
    end
  end

  scenario 'create event' do
    visit admin_path
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
    visit admin_path
    click_button 'zaplanuj'
    page.current_path.should == admin_path
    page.should have_content("Event nie został stworzony")
  end

  scenario 'delete event' do
    create(:event)
    visit admin_path
    click_link 'usuń'
    page.should_not have_content('1 września 2011, 10:00')
  end
end