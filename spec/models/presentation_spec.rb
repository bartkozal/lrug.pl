require "spec_helper"

describe Presentation do
  let(:presentation) { create(:presentation) }

  it "returns topic" do
    presentation.to_s.should == "Lorem ipsum dolor sit amet"
  end
end