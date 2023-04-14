class Task < ApplicationRecord
  belongs_to :user
  belongs_to :monthly_total

  after_create_commit :update_monthly_total_total_minutes
  after_update_commit :update_monthly_total_total_minutes
  after_destroy_commit :update_monthly_total_total_minutes

  private

  def update_monthly_total_total_minutes
    monthly_total.update_total_minutes
  end
end
