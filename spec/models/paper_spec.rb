require 'rails_helper'

describe "New paper page", type: :model do
  it "should have a working constructor" do
    paper = Paper.new(title: "My Paper", venue: "venue", year: 2022)
    expect(paper.venue).to eq("venue")
    expect(paper.title).to eq("My Paper")
    expect(paper.year).to eq(2022)
  end

  it "should not validate when title, venue or year is empty" do
    paper1 = Paper.new(title: "My Paper", venue: "venue", year:"" )
    expect(paper1).to_not be_valid
    paper2 = Paper.new(title: "My Paper", venue:"" , year: 2022 )
    expect(paper2).to_not be_valid
    paper2 = Paper.new(title:"" , venue: "venue", year: 2022 )
    expect(paper2).to_not be_valid
  end

  it "should not validate when year is not a numeric value" do
    paper1 = Paper.new(title: "My Paper", venue: "venue", year: "hallo" )
    expect(paper1).to_not be_valid
  end

  it "should have an empty list of authors" do
    paper = Paper.new(title: "My Paper", venue: "venue", year: 2022)
    expect(paper.authors).to eq([])
  end
end