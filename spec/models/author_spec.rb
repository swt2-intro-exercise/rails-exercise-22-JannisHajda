describe "Author model", type: :model do
    it "should have a first name, last name, and homepage" do
        author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
        expect(author.first_name).to eq('Alan')
        expect(author.last_name).to eq('Turing')
        expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
    end

    it "should return the full name" do
        author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
        expect(author.name).to eq('Alan Turing')
    end

    it "should not validate without a last name" do
        author = Author.new(first_name: 'Alan', last_name: '', homepage: 'http://wikipedia.org/Alan_Turing')
        expect(author).to_not be_valid
    end

    it "should update" do
        author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
        author.update(homepage: "https://de.wikipedia.org/wiki/Alan_Turing")
        expect(author.homepage).to eq("https://de.wikipedia.org/wiki/Alan_Turing")
    end

    it "should delete" do
        count = Author.count
        author = Author.new(first_name: 'Alan', last_name: 'Turing', homepage: 'http://wikipedia.org/Alan_Turing')
        author.destroy
        expect(Author.count).to eq(count)
    end
end
