require "spec_helper"

describe User do
  it "returns first name and last name" do
    build(:user, company: nil).to_s.should == "Johnny Cash"
  end

  it "returns company if exist" do
    build(:user).to_s.should == "Johnny Cash, Apple"
  end
end
