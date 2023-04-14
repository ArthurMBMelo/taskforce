class AddUserIdToMonthlyTotals < ActiveRecord::Migration[5.2]
  def change
    add_reference :monthly_totals, :user, foreign_key: true
  end
end
