json.extract! task, :id, :amount, :completion_time, :created_at, :updated_at
json.url task_url(task, format: :json)
