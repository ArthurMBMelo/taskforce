class MonthlyTotalsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Busca os registros de MonthlyTotal do mês atual
    @monthly_totals =
      MonthlyTotal.where(
        date: Date.current.beginning_of_month..Date.current.end_of_month
      )

    # Cria um hash que mapeia cada data para seu respectivo total de minutos
    @totals_by_date =
      @monthly_totals.index_by(&:date).transform_values(&:total_minutes)
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
