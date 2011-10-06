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

  context "deprecation" do
    it "returns false before event" do
      presentation = stub_model(Presentation, planned_at: 1.day.from_now)
      presentation.deprecated?.should be_false
    end

    it "returns true after event" do
      presentation = stub_model(Presentation, planned_at: 1.day.ago)
      presentation.deprecated?.should be_true
    end
  end
end