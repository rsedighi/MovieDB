require "test_helper"

feature "User is able to search" do
  scenario "home page loads" do
    visit root_path
    page.text.must_include "Welcome to MovieDB"
    find_button('Go').visible?
  end

  scenario "results are displayed" do
    visit root_path
    fill_in 'search', with: 'George Clooney, Brad Pitt'
    click_on "Go"
    page.text.must_include "George Clooney"
    page.text.must_include "Brad Pitt"
    page.text.must_include "Ocean's Eleven"
  end
end





