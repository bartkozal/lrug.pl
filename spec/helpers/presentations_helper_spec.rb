require 'spec_helper'

describe PresentationsHelper do
  before do
    @text = %{Lorem ipsum dolor sit amet}
    @link = %{<a href="http://www.example.com">Lorem ipsum dolor sit amet</a>}
  end

  it "returns link to presentation if exist" do
    presentation = build(:presentation)
    link_to_presentation(presentation).should == @link
  end

  it "returns text if it isn't exist" do
    presentation = build(:presentation, link: nil)
    link_to_presentation(presentation).should == @text
  end

  it "returns text if it's blank" do
    presentation = build(:presentation, link: "")
    link_to_presentation(presentation).should == @text
  end
end