describe "Author object", type: :model do
    it "should have a working constructor" do
        author = author.new(first_name:"Alan", last_name:"Turing", homepage: "https://en.wikipedia.org/wiki/Alan_Turing")
        expect(author.first_name).to eq("Alan")
        expect(author.last_name).to eq("Turing")
        expect(author.homepage).to eq("https://en.wikipedia.org/wiki/Alan_Turing")
    end
end