describe "Show paper page", type: :feature do
    it "should render withour error" do
        @paper = FactoryBot.create :paper
        visit paper_path(@paper)
    end

    it "should display paper information" do
        @paper = FactoryBot.create :paper
        visit paper_path(@paper)
        expect(page).to have_text(@paper.title)
        expect(page).to have_text(@paper.venue)
        expect(page).to have_text(@paper.year)
    end

    it "should display all the authors of the paper" do
        @paper = FactoryBot.create :paper
        visit paper_path(@paper)
        
        @paper.authors.each do |author|
            expect(page).to have_text(author.name)
        end
    end

    it "should have a link to the edit paper page" do
        @paper = FactoryBot.create :paper
        visit paper_path(@paper)
        expect(page).to have_link('Edit', href: edit_paper_path(@paper))
    end

    it "should have a link to the delete paper page" do
        @paper = FactoryBot.create :paper
        visit paper_path(@paper)
        expect(page).to have_link('Delete', href: paper_path(@paper))
    end

end