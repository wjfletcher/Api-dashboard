require "spec_helper"

feature "news", vcr: true do

  # As a user
  # I want to see the latest news headlines
  # So that I can stay informed with current events.

  # Acceptance Criteria
  # [x] Top tech stories displayed
  # [x] Top tech stories' titles displayed
  # [x] Top tech stories' abstracts displayed

  scenario "user sees current top tech news stories" do
    visit "/"
    # save_and_open_page
    expect(page).to have_content("Yahoo Says 1 Billion User Accounts Were Hacked")
    expect(page).to have_content("Flummoxed by the old-fashioned pastime")
  end
end
