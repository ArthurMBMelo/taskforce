class MonthlyTotal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :date, presence: true, uniqueness: { scope: :user_id }

  def total_minutes
    tasks.sum("amount * completion_time")
  end

  def update_total_minutes
    self.total_minutes = tasks.sum("completion_time * amount")
    save
  end
end
