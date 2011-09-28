require "spec_helper"

describe User do
  let(:presentation) { create(:presentation) }

  context "#to_s" do
    it "returns topic" do
      presentation.to_s.should == "Lorem ipsum dolor sit amet"
    end
  end
end