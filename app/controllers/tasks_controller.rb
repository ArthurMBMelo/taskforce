class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_monthly_total, only: %i[create update]
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks || []
    @total_minutes = total_minutes(@tasks)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @monthly_total =
      current_user.monthly_totals.find_or_create_by(date: Date.today)
    @task = @monthly_total.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @monthly_total =
      current_user.monthly_totals.find_or_create_by(date: Date.today)
    @task = @monthly_total.tasks.build(task_params)
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html do
          redirect_to task_url(@task), notice: "Task was successfully created."
        end
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html do
          redirect_to task_url(@task), notice: "Task was successfully updated."
        end
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html do
        redirect_to tasks_url, notice: "Task was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_monthly_total
    @monthly_total =
      current_user.monthly_totals.find_or_create_by(date: Date.today)
    @monthly_total.update_total_minutes
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:amount, :completion_time)
  end

  # Calculate the total minutes from a collection of tasks
  def total_minutes(tasks)
    total = tasks.sum("completion_time * amount")
    hours = (total / 60).floor
    minutes = (total % 60).floor
    Time.parse("#{hours}:#{minutes}").strftime("%H:%M")
  end
end
