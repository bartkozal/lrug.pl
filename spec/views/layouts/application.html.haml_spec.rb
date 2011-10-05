require 'spec_helper'

describe 'layouts/application.html.haml' do
  it 'displays logout link for current user' do
    define_current_user = %Q{def current_user; true; end; helper_method :current_user}
    controller.singleton_class.class_eval(define_current_user)

    render
    rendered.should have_link('Wyloguj', href: logout_path)
  end
end