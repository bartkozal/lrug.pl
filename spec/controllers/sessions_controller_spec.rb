require 'spec_helper'

describe SessionsController do
  let(:user) { build(:user, id: 1) }

  describe 'GET create action' do
    it 'login user and redirect to edit presentation path' do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
      session[:presentation_id] = 1
      User.stub(find_by_uid: user)

      get :create
      session[:user_id].should == user.id
      response.should redirect_to(edit_presentation_path(session[:presentation_id]))
    end
  end

  describe 'GET destroy action' do
    it 'logout user and redirect to root path' do
      get :destroy
      session[:user_id].should be_nil
      response.should redirect_to(root_path)
    end
  end
end