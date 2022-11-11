describe "Edited author page", type: :feature do
    it "should exist at 'edit_author_path' and render without error" do
        visit edit_author_path
    end

    it "should have text inputs for first_name, last_name and homepage" do
        visit edit_author_path
        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end

    it "should save the edited data for the author, when data is submitted" do
        visit edit_author_path
        page.fill_in 'author[first_name]', with: 'Edsger'
        page.fill_in 'author[last_name]', with: 'Dijkstra'
        page.fill_in 'author[hompage]', with: 'https://de.wikipedia.org/wiki/Edsger_W._Dijkstra'
        find('input[type="submit]').click
    end

    it "should update the data of the author in th database" do
        visit edit_author_path
        @alan = FactoryBot.create :author
        page.fill_in 'author[first_name]', with: 'Edsger'
        page.fill_in 'author[last_name]', with: 'Dijkstra'
        page.fill_in 'author[hompage]', with: 'https://de.wikipedia.org/wiki/Edsger_W._Dijkstra'
        find('input[type="submit]').click
        expect(@alan.reload.first_name).to eq('Edsger')
        expect(@alan.reload.last_name).to eq('Dijkstra')
        expect(@alan.reload.homepage).to eq('https://de.wikipedia.org/wiki/Edsger_W._Dijkstra')

    end
end