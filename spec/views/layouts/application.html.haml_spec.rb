require 'spec_helper'

describe 'layouts/application.html.haml' do
  def current_user(bool)
    klass = %Q{def current_user; #{bool}; end; helper_method :current_user}
    controller.singleton_class.class_eval(klass)
  end

  it 'displays logout link for current user' do
    current_user true
    render
    rendered.should have_link('Wyloguj', href: logout_path)
  end

  it 'displays login with github' do
    current_user false
    render
    rendered.should have_link('Zaloguj przez GitHub', href: '/auth/github')
  end
end