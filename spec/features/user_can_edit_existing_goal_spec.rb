require 'rails_helper'

RSpec.feature "User can edit a goal" do
  scenario "edits an existing goal and can see changes" do
    goal = Goal.create(title: "Goal1", description: "Wooo weeee!")

    visit goal_path(goal)

    click_on "Edit Goal"

    fill_in 'goal_title', with: "Baller Goals"
    click_on "Update Goal"

    expect(current_path).to eq goal_path(goal)
    expect(page).to have_content "Baller Goals"
    expect(page).to have_content "Wooo weeee!"
  end
end
