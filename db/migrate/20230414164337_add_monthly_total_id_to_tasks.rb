class AddMonthlyTotalIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :monthly_total, foreign_key: true
  end
end
