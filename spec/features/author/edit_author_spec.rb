describe "Author edit page", type: :feature do
    it "should render withour error" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)
    end

    it "should have a text input for the author's first name, last name, and homepage" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)
        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end

    it "should save the author after submitting the form" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)
        fill_in 'author[first_name]', with: 'Alan Mathison'
        find('input[type="submit"]').click
        @alan.reload
        expect(@alan.first_name).to eq('Alan Mathison')
    end
end