# encoding: UTF-8

require 'spec_helper'

describe PresentationsController do
  let(:presentation) { build(:presentation, id: 1) }
  before { Presentation.stub(find: presentation) }

  describe 'GET edit action' do
    context "user didn't log in" do
      it "stores presentation id in session and redirect to GH auth" do
        controller.stub(current_user: nil)
        get :edit, :id => 1
        session[:presentation_id].should == presentation.id
        response.should redirect_to('/auth/github')
      end
    end

    context "user is logged in" do
      it "will render template edit if user is presentation owner" do
        current_user = mock(lecture?: true)
        controller.stub(current_user: current_user)
        get :edit, :id => 1
        response.should render_template(:edit)
      end

      it "will redirect to home if user isn't presentation owner" do
        current_user = mock(lecture?: false)
        controller.stub(current_user: current_user)
        get :edit, :id => 1
        response.should redirect_to(root_path)
      end
    end
  end

  describe 'PUT update action' do
    context "presentation is valid" do
      it "updates topic, user and redirect to home" do
        presentation.stub(save: true)
        put :update, :id => 1, :presentation => { topic: 'To be or not to be' }
        presentation.topic.should == 'To be or not to be'
        response.should redirect_to(root_path)
      end
    end

    context "presentation isn't valid" do
      it "render template edit and set alert" do
        presentation.stub(save: false)
        put :update, :id => 1, :presentation => { topic: nil }
        flash.now[:alert].should == 'Prezentacja nie została zgłoszona'
        response.should render_template(:edit)
      end
    end
  end
end