describe "Paper index page", type: :feature do
    it "should render withour error" do
        visit papers_path
    end

    it "should display paper information" do
        @paper = FactoryBot.create :paper
        visit papers_path
        expect(page).to have_text(@paper.title)
        expect(page).to have_text(@paper.venue)
        expect(page).to have_text(@paper.year)
    end

    it "should have a link to the new paper page" do
        visit papers_path
        expect(page).to have_link('New', href: new_paper_path)
    end

    it "should have a link to the show paper page" do
        @paper = FactoryBot.create :paper
        visit papers_path
        expect(page).to have_link('Show', href: paper_path(@paper))
    end

    it "should have a link to the edit paper page" do
        @paper = FactoryBot.create :paper
        visit papers_path
        expect(page).to have_link('Edit', href: edit_paper_path(@paper))
    end

    it "should have a link to the delete paper page" do
        @paper = FactoryBot.create :paper
        visit papers_path
        expect(page).to have_link('Delete', href: paper_path(@paper))
    end
end