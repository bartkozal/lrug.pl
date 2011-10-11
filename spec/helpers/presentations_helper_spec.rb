require 'spec_helper'

describe PresentationsHelper do
  describe "#link_to_presentation" do
    before do
      @text = %{Lorem ipsum dolor sit amet}
      @link = %{<a href="http://www.example.com">Lorem ipsum dolor sit amet</a>}
    end

    it "will return link to presentation if link exists" do
      presentation = build(:presentation)
      link_to_presentation(presentation).should == @link
    end

    it "will return text if link doesn't exist" do
      presentation = build(:presentation, link: nil)
      link_to_presentation(presentation).should == @text
    end

    it "will return text if link is blank" do
      presentation = build(:presentation, link: "")
      link_to_presentation(presentation).should == @text
    end
  end
end