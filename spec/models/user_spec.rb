require "spec_helper"

describe User do
  it "returns first name and last name" do
    build(:user).to_s.should == "Johnny Cash"
  end

  it "returns company if exist" do
    build(:user_with_company).to_s.should == "Johnny Cash, Apple"
  end
end
