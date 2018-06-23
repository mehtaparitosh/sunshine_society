class EmployeeWorkplacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee_workplace, only: [:edit, :update, :destroy]

  def new
    if params[:employee_id] 
      @employee = Employee.find(params[:employee_id])
    elsif params[:workplace_id] 
      @workplace = Workplace.find(params[:workplace_id])
    else
    end
    @employees = Employee.all
    @workplaces = Workplace.all
    @employee_workplace = EmployeeWorkplace.new
  end

  def edit
    if params[:employee_id] 
      @employee = Employee.find(params[:employee_id])
    elsif params[:workplace_id] 
      @workplace = Workplace.find(params[:workplace_id])
    else
    end
    @employees = Employee.all
    @workplaces = Workplace.all
  end

  def create
    @employee_workplace = EmployeeWorkplace.new(employee_workplace_params)

    respond_to do |format|
      if @employee_workplace.save
        format.html { 
          if params[:employee_id] 
            @employee = Employee.find(@employee_workplace.employee_id)
            redirect_to @employee, notice: 'employee workplace was successfully created.'
          elsif params[:workplace_id] 
            @workplace = Workplace.find(@employee_workplace.workplace_id)
            redirect_to @workplace, notice: 'employee workplace was successfully created.'
          else
            redirect_to root_path, notice: 'employee workplace was successfully created.'
          end 
        }
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
        format.html { 
          if params[:employee_id] 
            @employee = Employee.find(@employee_workplace.employee_id)
            redirect_to @employee, notice: 'employee workplace was successfully updated.'
          elsif params[:workplace_id] 
            @workplace = Workplace.find(@employee_workplace.workplace_id)
            redirect_to @workplace, notice: 'employee workplace was successfully updated.'
          else
            redirect_to root_path, notice: 'employee workplace was successfully updated.'
          end 
        }
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
