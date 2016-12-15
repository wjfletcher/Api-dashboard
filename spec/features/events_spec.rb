require "spec_helper"

feature "events", vcr: true do

  # As a user
  # I want to know what events are happening today
  # So that I can plan my evening.

  # Acceptance Criteria
  # [x] User location current events are displayed
  # [x] User location current event titles are displayed
  # [x] User location current event venues are displayed

  scenario "user sees their local events for that evening" do
    visit "/"
    # save_and_open_page
    expect(page).to have_content("Coco")
    expect(page).to have_content("TD Garden")
  end
end
