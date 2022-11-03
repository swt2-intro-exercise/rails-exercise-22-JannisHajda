describe "Author index page", type: :feature do
    it "should render withour error" do
        visit authors_path
    end

    it "should have a table with the correct headers" do
        visit authors_path
        expect(page).to have_text('Name')
        expect(page).to have_text('Homepage')
    end

    it "should display author information" do
        @alan = FactoryBot.create :author
        visit authors_path
        expect(page).to have_text(@alan.name)
        expect(page).to have_text(@alan.homepage)
    end

    it "should have a link to the new author page" do
        visit authors_path
        expect(page).to have_link('New', href: new_author_path)
    end
    
    it "should have a link to the show author page" do
        @alan = FactoryBot.create :author
        visit authors_path
        expect(page).to have_link('Show', href: author_path(@alan))  
    end
    
    it "should have a link to the edit author page" do
        @alan = FactoryBot.create :author
        visit authors_path
        expect(page).to have_link('Edit', href: edit_author_path(@alan))
    end

    it "should have a link to the delete author page" do
        @alan = FactoryBot.create :author
        visit authors_path
        expect(page).to have_link('Delete', href: author_path(@alan))  
    end

end
