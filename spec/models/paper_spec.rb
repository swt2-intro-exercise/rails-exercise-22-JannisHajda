require 'rails_helper'

describe "Paper model" do
  it "should have a title, venue, and year" do
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    expect(paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(paper.venue).to eq("Mind 49: 433-460")
    expect(paper.year).to eq(1950)
  end

  it "should not validate without a title" do
    paper = Paper.new(title: "", venue: "Mind 49: 433-460", year: 1950)
    expect(paper).to_not be_valid
  end
end
