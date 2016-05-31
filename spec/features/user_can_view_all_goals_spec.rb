require 'rails_helper'

RSpec.feature "User sees all goals" do
  scenario "user can click each goal" do
    goal1 = Goal.create(title: "Goal1", description: "This is the first goal.")
    goal2 = Goal.create(title: "Goal2", description: "This is the second goal.")

    visit goals_path

    expect(page).to have_link "Goal1", href: goal_path(goal1)
    expect(page).to have_link "Goal2", href: goal_path(goal2)

    click_on "Goal1"

    expect(page).to have_content "Goal1"
    expect(page).to have_content "This is the first goal."
  end
end
