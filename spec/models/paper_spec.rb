require 'rails_helper'

describe "New paper paper", type: :model do
  it "should have a working constructor" do
    paper = Paper.new(title: "My Paper", venue: "venue", year: 2022)
    expect(paper.venue).to eq("venue")
    expect(paper.title).to eq("My Paper")
    expect(paper.year).to eq(2022)
  end
end