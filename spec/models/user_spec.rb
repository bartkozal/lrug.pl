require "spec_helper"

describe User do
  let(:user) { create(:user) }
  let(:user_with_company) { create(:user_with_company) }

  it "returns first name and last name" do
    user.to_s.should == "Johnny Cash"
  end

  it "returns company if exist" do
    user_with_company.to_s.should == "Johnny Cash, Apple"
  end
end
