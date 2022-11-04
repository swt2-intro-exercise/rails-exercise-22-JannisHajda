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

    it "should filter paper page" do
        @paper = FactoryBot.create :paper

        @paper2 = FactoryBot.create :paper
        @paper2.title = "SampleTitle"
        @paper2.venue = "SampleVenue"
        @paper2.year = 1952
        @paper2.save

        visit papers_path(year: 1950)

        expect(page).to have_text(@paper.title)
        expect(page).to have_text(@paper.venue)
        expect(page).to have_text(@paper.year)

        expect(page).not_to have_text(@paper2.title)
        expect(page).not_to have_text(@paper2.venue)
        expect(page).not_to have_text(@paper2.year)  

        visit papers_path(year: 1952)

        expect(page).not_to have_text(@paper.title)
        expect(page).not_to have_text(@paper.venue)
        expect(page).not_to have_text(@paper.year)

        expect(page).to have_text(@paper2.title)
        expect(page).to have_text(@paper2.venue)
        expect(page).to have_text(@paper2.year)
    end 
end