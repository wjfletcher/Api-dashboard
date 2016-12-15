require "spec_helper"

feature "weather", vcr: true do

  # As a user
  # I want to see my current weather
  # So I know how to dress when I go outside.

  # Acceptance Criteria
  # [x] User location current weather temperature is displayed
  # [x] User location current weather conditions are displayed

  scenario "user sees their current weather conditions" do
    visit "/"
    # save_and_open_page
    expect(page).to have_content("Clear")
    expect(page).to have_content("25.83")
  end
end
