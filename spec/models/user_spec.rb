require "spec_helper"

describe User do
  let(:user) { build(:user) }

  it "returns first name and last name" do
    user.stub(company: nil)
    user.to_s.should == "Johnny Cash"
  end

  it "returns company if exist" do
    user.to_s.should == "Johnny Cash, Apple"
  end

  it "create user with omniauth" do
    User.create_with_omniauth(OmniAuth.config.mock_auth[:github])
    last_user = User.last
    last_user.name.should == 'Steve Jobs'
    last_user.company.should == 'Apple'
  end

  describe "#lecture?" do
    let(:presentation) { build(:presentation) }

    it "will return true if user adds presentation" do
      user.presentations << presentation
      user.lecture?(presentation).should be_true
    end

    it "will return false if user doesn't add presentation" do
      user.lecture?(presentation).should be_false
    end
  end
end
