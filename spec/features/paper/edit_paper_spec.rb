describe "Edit paper page", type: :feature do
    it "should render withour error" do
        @paper = FactoryBot.create :paper
        visit edit_paper_path(@paper)
    end

    it "should have a text input for the paper's title, venue, and year" do
        @paper = FactoryBot.create :paper
        visit edit_paper_path(@paper)
        expect(page).to have_field('paper[title]')
        expect(page).to have_field('paper[venue]')
        expect(page).to have_field('paper[year]')
    end

    it "should save the paper after submitting the form" do
        @paper = FactoryBot.create :paper
        visit edit_paper_path(@paper)
        fill_in 'paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
        find('input[type="submit"]').click
        @paper.reload
        expect(@paper.title).to eq('COMPUTING MACHINERY AND INTELLIGENCE')
    end

    it "should have a select box for the paper's authors" do
        @paper = FactoryBot.create :paper
        visit edit_paper_path(@paper)
        expect(page).to have_select('paper[author_ids][]')
    end

    it "should show all authors in the select box" do
        @alan = FactoryBot.create :author
        @paper = FactoryBot.create :paper
        visit edit_paper_path(@paper)
        expect(page).to have_select('paper[author_ids][]', with_options: [@alan.name])
    end
end