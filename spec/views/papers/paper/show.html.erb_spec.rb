require 'rails_helper'

RSpec.describe "papers/show", type: :view do
  before(:each) do
    assign(:paper, Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/2/)
  end

  it "should display the full name of the author" do
    @compunting_paper = FactoryBot.create :paper
    vist papers_path(@computing_paper)
    @computing_paper.authors.each do |author|
      expect(page).to have_text(author.name)
    end
  end
end
