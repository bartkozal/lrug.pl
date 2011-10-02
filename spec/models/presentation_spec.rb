require "spec_helper"

describe Presentation do
  it "returns topic" do
    build(:presentation).to_s.should == "Lorem ipsum dolor sit amet"
  end
end