require 'spec_helper'

describe 'layouts/application.html.haml' do
  it 'displays logout link for current user' do
    view.stub(:current_user) { true }
    render
    rendered.should have_link('Wyloguj', href: logout_path)
  end

  it 'displays login with github' do
    view.stub(:current_user) { false }
    render
    rendered.should have_link('Zaloguj przez GitHub', href: '/auth/github')
  end
end