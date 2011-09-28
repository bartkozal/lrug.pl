# encoding: UTF-8

require "spec_helper"

describe Event do
  let(:event) { create(:event) }

  it "returns formated planned at" do
    event.date.should == "1 września 2011"
  end

  it "returns formated planned at with time" do
    event.datetime.should == "1 września 2011, 10:00"
  end
end
