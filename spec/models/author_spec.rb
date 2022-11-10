describe "Author object", type: :model do
  it "should have a working constructor" do
      author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "https://en.wikipedia.org/wiki/Alan_Turing")
      expect(author.first_name).to eq("Alan")
      expect(author.homepage).to eq("https://en.wikipedia.org/wiki/Alan_Turing")
      expect(author.name).to eq("Alan Turing")
  end
end