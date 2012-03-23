# encoding: UTF-8

require "spec_helper"

describe Event do
  let(:event) { build(:event) }

  it "fails validation with blank planned at date" do
    event.stub(:planned_at => nil).should have(1).errors_on(:planned_at)
  end

  it "returns formated planned at" do
    event.date.should == "1 września 2020"
  end

  it "returns formated planned at with time" do
    event.datetime.should == "1 września 2020, 10:00"
  end

  it "saves 3 presentations after create" do
    expect { event.save }.to change{ event.presentations.count }.by(3)
  end

  it "saves default tasks after create" do
    expect { event.save }.to change{ event.tasks.count }.by(4)
  end
end
