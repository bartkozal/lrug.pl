# encoding: UTF-8

require "spec_helper"

describe Event do
  it "returns formated planned at" do
    build(:event).date.should == "1 września 2011"
  end

  it "returns formated planned at with time" do
    build(:event).datetime.should == "1 września 2011, 10:00"
  end

  it "fails validation with blank planned at date" do
    build(:event, :planned_at => nil).should have(1).errors_on(:planned_at)
  end
end
