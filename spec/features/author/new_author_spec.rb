require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    #https://guides.rubyonrails.org/routing.html #path-and-url-helpers
    visit new_author_path
  end
  it "should have text inputs for an author's first name, last name and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails from builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should save a author" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Edsger'
    page.fill_in 'author[last_name]', with: 'Dijkstra'
    page.fill_in 'author[homepage]', with: 'https://de.wikipedia.org/wiki/Edsger_W._Dijkstra'
    find('input[type="submit"]').click
    #expect(Author.where(first_name: "Edsger").first.homepage).to eq("https://de.wikipedia.org/wiki/Edsger_W._Dijkstra")
    #expect(Author.where(first_name: "AAA".size)).to eq(0)
  end
end
