require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup { @task = tasks(:one) }

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Amount", with: @task.amount
    fill_in "Completion time", with: @task.completion_time
    click_on "Create Task"

    assert_text "Task was successfully created"
    click_on "Back"
  end

  test "updating a Task" do
    visit tasks_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @task.amount
    fill_in "Completion time", with: @task.completion_time
    click_on "Update Task"

    assert_text "Task was successfully updated"
    click_on "Back"
  end

  test "destroying a Task" do
    visit tasks_url
    page.accept_confirm { click_on "Destroy", match: :first }

    assert_text "Task was successfully destroyed"
  end
end
