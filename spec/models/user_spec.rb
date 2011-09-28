require "spec_helper"

describe User do
  let(:user) { create(:user) }

  it "returns first name and last name" do
    user.to_s.should == "Johnny Cash"
  end
end
