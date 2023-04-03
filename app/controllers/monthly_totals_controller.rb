class MonthlyTotalsController < ApplicationController
  def index
    @monthly_totals = MonthlyTotal.all
  end

  def show
    # @monthly_total = MonthlyTotal.find_by(date: params[:date])
    # @tasks = @monthly_total.tasks
    # @total_minutes = @tasks.sum(:completion_time)
    @date = Date.parse(params[:date])
    @tasks = Task.where(created_at: @date)
    @total_minutes = MonthlyTotal.find_by(date: @date)&.total_minutes || 0
  end
end
