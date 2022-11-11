require 'rails_helper'

describe "Edit page for authors", type: :feature do
    it "should exist at 'edit_author_path' and render without error" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)
    end

    it "should have text inputs for first_name, last_name and homepage" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)

        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end

    it "should have an submit button" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)

        expect(page).to have_css('input[type="submit"]')
    end

    # it "should save the edited data for the author, when data is submitted" do
    #     @alan = FactoryBot.create :author
    #     visit edit_author_path(@alan)

    #     page.fill_in 'author[first_name]', with: 'Edsger'
    #     page.fill_in 'author[last_name]', with: 'Dijkstra'
    #     page.fill_in 'author[hompage]', with: 'https://de.wikipedia.org/wiki/Edsger_W._Dijkstra'
    #     find('input[type="submit]').click
    # end

    it "should update the data of the author in th database" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)

        page.fill_in 'author[first_name]', with: 'Edsger'
        page.fill_in 'author[last_name]', with: 'Dijkstra'
        page.fill_in 'author[homepage]', with: 'https://de.wikipedia.org/wiki/edsger_w._dijkstra'
        find('input[type="submit"]').click

        @alan.reload

        expect(@alan.first_name).to eq('Edsger')
        expect(@alan.last_name).to eq('Dijkstra')
        expect(@alan.homepage).to eq('https://de.wikipedia.org/wiki/edsger_w._dijkstra')

    end
end