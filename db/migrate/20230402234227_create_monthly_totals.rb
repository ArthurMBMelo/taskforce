class CreateMonthlyTotals < ActiveRecord::Migration[5.2]
  def change
    create_table :monthly_totals do |t|
      t.date :date
      t.integer :total_minutes

      t.timestamps
    end
  end
end
