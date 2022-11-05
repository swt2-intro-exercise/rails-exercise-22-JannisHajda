require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  it "should have a text input for the author's first name, last name, and homepage" do
    visit new_author_path
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end

  it "should save the author after submitting the form" do
    visit new_author_path
    fill_in 'author[first_name]', with: 'Alan'
    fill_in 'author[last_name]', with: 'Turing'
    fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
  end

  it "should show validation errors if the form is submitted without a last name" do
    visit new_author_path
    fill_in 'author[first_name]', with: 'Alan'
    fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
    expect(page).to have_text("Last name can't be blank")
    expect(page).to have_text("Last name is too short (minimum is 1 character)")
  end

  it "should have a select box for the author's papers" do
    visit new_author_path
    expect(page).to have_select('author[paper_ids][]')
  end

  it "should show all papers in the select box" do
    @paper = FactoryBot.create :paper
    visit new_author_path
    expect(page).to have_select('author[paper_ids][]', with_options: [@paper.title])
  end
end
