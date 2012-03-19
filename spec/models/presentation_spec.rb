require "spec_helper"

describe Presentation do
  let(:presentation) { build(:presentation) }

  it "success validation with blank topic on create" do
    presentation.save
    presentation.should have(0).errors_on(:topic)
  end

  it "fails validation with blank topic on update" do
    presentation.update_attributes(topic: nil)
    presentation.should have(1).errors_on(:topic)
  end

  it "returns topic" do
    presentation.to_s.should == "Lorem ipsum dolor sit amet"
  end

  context "deprecation" do
    it "returns false before event" do
      presentation.stub(planned_at: 1.day.from_now)
      presentation.outdated?.should be_false
    end

    it "returns true after event" do
      presentation.stub(planned_at: 1.day.ago)
      presentation.outdated?.should be_true
    end
  end
end
