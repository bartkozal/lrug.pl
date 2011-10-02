# encoding: UTF-8

require 'spec_helper'

feature 'reporting presentation' do
  before do
    create(:event)
    @user = create(:user)
  end

  scenario 'login by GitHub account and send presentation title' do
    visit '/'
    click_link 'zgłoś się do prezentacji'
    current_path.should == new_presentation_path
    current_path.should have_selector('.new_presentation')
    click_button 'zatwierdź'
    current_path.should == root_path
    page.should have_content(@user)
  end
end