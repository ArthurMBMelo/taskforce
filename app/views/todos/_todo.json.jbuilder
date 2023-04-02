json.extract! todo, :id, :amount, :completion_time, :created_at, :updated_at
json.url todo_url(todo, format: :json)
