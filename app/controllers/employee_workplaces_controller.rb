class EmployeeWorkplacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee_workplace, only: [:edit, :update, :destroy]

  def new
    @employees = Employee.all
    @workplaces = Workplace.all
    @employee_workplace = EmployeeWorkplace.new
  end

  def edit
    @employees = Employee.all
    @workplaces = Workplace.all
  end

  def create
    @employee_workplace = EmployeeWorkplace.new(employee_workplace_params)

    respond_to do |format|
      if @employee_workplace.save
        format.html { redirect_to @employee_workplace, notice: 'Employee Workplace was successfully created.' }
        format.json { render :show, status: :created, location: @employee_workplace }
      else
        format.html { render :new }
        format.json { render json: @employee_workplace.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee_workplace.update(employee_workplace_params)
        format.html { redirect_to @employee_workplace, notice: 'Employee Workplace was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_workplace }
      else
        format.html { render :edit }
        format.json { render json: @employee_workplace.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @employee_workplace.destroy
    respond_to do |format|
      format.html { redirect_to employee_workplaces_url, notice: 'Employee Workplace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_workplace
      @employee_workplace = EmployeeWorkplace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_workplace_params
      params.require(:employee_workplace).permit(:active, :employee_id, :workplace_id)
    end
end
