require 'rails_helper'

RSpec.feature "User can delete a goal" do
  scenario "deleted goal is no longer part of all goals" do
    goal1 = Goal.create(title: "Goal1", description: "first goal")
    goal2 = Goal.create(title: "Goal2", description: "second goal")

    visit goal_path(goal1)

    click_on "Delete Goal"

    expect(current_path).to eq(goals_path)
    expect(page).to have_content goal2.title
    expect(page).to have_content goal2.description

    expect(page).to_not have_content goal1.title
    expect(page).to_not have_content goal1.description
  end
end
