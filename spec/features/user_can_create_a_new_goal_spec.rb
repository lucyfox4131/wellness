require 'rails_helper'

RSpec.feature "User creates a new goal" do
  scenario "they can see the new goal they've created" do
    title = "Best Goal Ever"
    description = "This is by far the best goal."

    visit goals_path

    click_on "Make a new goal"

    fill_in "goal_title", with: title
    fill_in "goal_description", with: description
    click_on "Create Goal"

    expect(page).to have_content title
    expect(page).to have_content description
  end
end
