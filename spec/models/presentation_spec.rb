require "spec_helper"

describe Presentation do
  it "returns topic" do
    build(:presentation).to_s.should == "Lorem ipsum dolor sit amet"
  end

  it "success validation with blank topic on create" do
    build(:presentation, topic: nil).should have(0).errors_on(:topic)
  end

  it "fails validation with blank topic on update" do
    presentation = create(:presentation, topic: nil)
    presentation.update_attributes(topic: nil)
    presentation.should have(1).errors_on(:topic)
  end
end