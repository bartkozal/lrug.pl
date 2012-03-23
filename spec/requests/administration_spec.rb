# encoding: UTF-8

require 'spec_helper'

feature 'manage events' do
  def create_event
    select '30', from: 'event_planned_at_3i'
    select 'Listopad', from: 'event_planned_at_2i'
    select '2011', from: 'event_planned_at_1i'
    select '06', from: 'event_planned_at_4i'
    select '30', from: 'event_planned_at_5i'
    click_button 'zaplanuj'
  end

  background do
    create(:event)
    page.driver.header('Authorization', %Q{Basic #{Base64.encode64("admin:example")}})
    visit admin_path
  end

  scenario 'list events' do
    page.should have_selector('form.new_event')
    page.should have_content('1 września 2020, 10:00')
    page.should have_link('usuń')
  end

  scenario 'create event' do
    create_event
    page.current_path.should == admin_path
    page.should have_content('30 listopada 2011, 06:30')
  end

  scenario 'display todo list' do
    create_event
    page.should have_content('Lista zadań do zrobienia:')
    page.should have_content('Założyć wątek na forum RoR')
    page.should have_content('Założyć event na Facebook')
    page.should have_content('Tweet')
    page.should have_content('Napisać na grupie dyskusyjnej JUGu')
  end

  scenario 'create event fails' do
    click_button 'zaplanuj'
    page.current_path.should == admin_path
    page.should have_content("Event nie został utworzony")
  end

  scenario 'delete event' do
    click_link 'usuń'
    page.should_not have_content('1 września 2011, 10:00')
    page.should have_content("Event usunięty")
  end
end

feature 'manage presentations' do
  background do
    @presentation = create(:presentation)
    page.driver.header('Authorization', %Q{Basic #{Base64.encode64("admin:example")}})
  end

  scenario 'edit presentation' do
    visit admin_path
    find('.list').click_link 'edytuj'
    fill_in 'Temat', with: 'Nowy temat'
    fill_in 'Link', with: 'http://www.example.com'
    click_button 'Edytuj'
    page.should have_content('Prezentacja zmieniona')
    visit root_path
    page.should have_link('Nowy temat', href: 'http://www.example.com')
  end

  scenario 'delete presentation' do
    visit root_path
    page.should have_content(@presentation.topic)
    visit admin_path
    4.times { find('.list').click_link 'usuń' }
    page.should have_content('Prezentacja usunięta')
    visit root_path
    page.should_not have_content(@presentation.topic)
  end
end
