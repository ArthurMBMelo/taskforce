require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup { @task = tasks(:one) }

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url,
           params: {
             task: {
               amount: @task.amount,
               completion_time: @task.completion_time
             }
           }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task),
          params: {
            task: {
              amount: @task.amount,
              completion_time: @task.completion_time
            }
          }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) { delete task_url(@task) }

    assert_redirected_to tasks_url
  end
end
