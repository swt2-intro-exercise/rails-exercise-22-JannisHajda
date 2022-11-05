describe "New paper page", type: :feature do
    it "should render withour error" do
        visit new_paper_path
    end

    it "should have a text input for the paper's title, venue, and year" do
        visit new_paper_path
        expect(page).to have_field('paper[title]')
        expect(page).to have_field('paper[venue]')
        expect(page).to have_field('paper[year]')
    end

    it "should save the paper after submitting the form" do
        visit new_paper_path
        fill_in 'paper[title]', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
        fill_in 'paper[venue]', with: 'Mind 49: 433-460'
        fill_in 'paper[year]', with: '1950'
        find('input[type="submit"]').click
    end

    it "should show validation errors if the form is submitted without a title" do
        visit new_paper_path
        fill_in 'paper[venue]', with: 'Mind 49: 433-460'
        fill_in 'paper[year]', with: '1950'
        find('input[type="submit"]').click
        expect(page).to have_text("Title can't be blank")
    end

    it "should have a select box for the paper's authors" do
        visit new_paper_path
        expect(page).to have_select('paper[author_ids][]')
    end

    it "should show all authors in the select box" do
        @alan = FactoryBot.create :author
        visit new_paper_path
        expect(page).to have_select('paper[author_ids][]', with_options: [@alan.name])
    end
end