require 'rails_helper'

describe "Author page", type: :feature do
    it "should have a link to delete an author" do
        @alan = FactoryBot.create :author
        visit authors_path(@alan)
        expect(page).to have_link('Delete')
    end 

    it "should allow to delete an author" do
        @author = Author.new(first_name:'Alan', last_name:'Turing', homepage:'http://wikipedia.de/alan_turing')
        @author.save
        visit authors_path(@author) 
        count_before = Author.count   
        click_link("Delete")
        expect(count_before).to eq Author.count+1
    end
end    