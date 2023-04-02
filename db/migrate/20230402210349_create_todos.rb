class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.integer :amount
      t.float :completion_time

      t.timestamps
    end
  end
end
