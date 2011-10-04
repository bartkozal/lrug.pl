# encoding: UTF-8

require 'spec_helper'

feature 'reporting presentation' do
  background do
    User.stub(:create_with_omniauth) { create(:user) }
    create(:event)
  end

  scenario "login by GitHub account and send presentation title" do
    visit '/'
    click_link('zgłoś się do prezentacji')
    current_path.should == edit_presentation_path(Presentation.first)
    page.should have_content('Johnny Cash, Apple')
    fill_in 'presentation_topic', with: 'Ruby imba'
    click_button 'zgłoś'
    within '.presentation' do
      page.should have_css('.topic', text: 'Ruby imba')
      page.should have_css('.author', text: 'Johnny Cash, Apple')
      page.should have_link('edytuj tytuł')
    end
  end
end
