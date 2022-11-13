require 'rails_helper'

RSpec.describe "papers/index", type: :view do
  before(:each) do
    assign(:papers, [
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      ),
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      )
    ])
  end

  it "renders a list of papers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Venue".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end

  it "should have an link to edit a paper" do
    visit papers_path
    expect(page).to have_link('Edit')
  end

  it "should have an link to delete a paper" do
    visit papers_path
    expect(page).to have_link('Delete')
  end

  context "given a paper from 1950 and a Paper from 1968" do
    before :each do
        @paper1 = Paper.new(
            title: 'Paper1',
            venue: 'venue',
            year: 1950
        )
        @paper1.save
        @paper2 = Paper.new(
            title: 'Paper2',
            venue: 'venue',
            year: 1968
        )
        @paper2.save
    end
 
    it "should only show the paper1 when year in url matches" do
        visit papers_path + "?year=1950"
        expect(page).to have_xpath("//a[@href='#{paper_path(@paper1)}']")
        expect(page).not_to have_xpath("//a[@href='#{paper_path(@paper2)}']")
    end
  end
end
