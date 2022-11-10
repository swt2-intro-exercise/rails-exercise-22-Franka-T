describe "Author object", type: :model do
  it "should have a working constructor" do
    author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "https://en.wikipedia.org/wiki/Alan_Turing")
    expect(author.first_name).to eq("Alan")
    expect(author.homepage).to eq("https://en.wikipedia.org/wiki/Alan_Turing")
    
  end

  it "should return a name" do
    #author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "https://en.wikipedia.org/wiki/Alan_Turing")
    @alan = FactoryBot.create :author
    expect(@alan.name).to eq("Alan Turing")
  end
  
  it "should validate author with a last name that is not empty" do
    @alan =  FactoryBot.create :author
    expect(@alan).to be_valid
  end 

  it "should not validate author with a last name that is empty" do
    author = Author.new(first_name: "Alan", last_name: "", homepage: "https://en.wikipedia.org/wiki/Alan_Turing")
    expect(@author.)to_not be_valid
  end
end