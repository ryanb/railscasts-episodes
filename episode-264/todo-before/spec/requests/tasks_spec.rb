require "spec_helper"

describe "Tasks" do
  it "displays tasks" do
    Task.create!(:name => "paint fence")
    visit tasks_path
    page.should have_content("paint fence")
  end

  it "creates a task with validation error" do
    visit tasks_path
    fill_in "New Task", :with => ""
    click_button "Add"
    page.should have_content("Invalid Field")
    fill_in "New Task", :with => "mow lawn"
    click_button "Add"
    page.should have_content("Successfully added task.")
    page.should have_content("mow lawn")
  end
end
