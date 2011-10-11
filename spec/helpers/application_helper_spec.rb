require 'spec_helper'

describe ApplicationHelper do
  describe "#title" do
    it "will return LRUG if argument is blank" do
      title('').should == 'LRUG'
    end

    it "will return LRUG and page title separated with '::' if argument exists" do
      title('Page').should == 'LRUG :: Page'
    end
  end
end