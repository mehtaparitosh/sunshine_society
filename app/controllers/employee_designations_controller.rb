class EmployeeDesignationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee_designation, only: [:edit, :update, :destroy]

  def new
    if params[:employee_id]
      @employee = Employee.find(params[:employee_id])
    elsif params[:designation_id]
      @designation = Designation.find(params[:designation_id])
    else
    end
    @employees = Employee.all
    @designations = Designation.all
    @employee_designation = EmployeeDesignation.new
  end

  def edit
    if params[:employee_id]
      @employee = Employee.find(params[:employee_id])
    elsif params[:designation_id]
      @designation = Designation.find(params[:designation_id])
    else
    end
    @employees = Employee.all
    @designations = Designation.all
  end

  def create
    @employee_designation = EmployeeDesignation.new(employee_designation_params)

    respond_to do |format|
      if @employee_designation.save
        format.html {
          if params[:employee_id]
            @employee = Employee.find(@employee_designation.employee_id)
            redirect_to @employee, notice: 'employee designation was successfully created.'
          elsif params[:designation_id]
            @designation = Designation.find(@employee_designation.designation_id)
            redirect_to @designation, notice: 'employee designation was successfully created.'
          else
            redirect_to root_path, notice: 'employee designation was successfully created.'
          end
        }
        format.json { render :show, status: :created, location: @employee_designation }
      else
        format.html { render :new }
        format.json { render json: @employee_designation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee_designation.update(employee_designation_params)
        format.html {
          if params[:employee_id]
            @employee = Employee.find(@employee_designation.employee_id)
            redirect_to @employee, notice: 'employee designation was successfully updated.'
          elsif params[:designation_id]
            @designation = Designation.find(@employee_designation.designation_id)
            redirect_to @designation, notice: 'employee designation was successfully updated.'
          else
            redirect_to root_path, notice: 'employee designation was successfully updated.'
          end
        }
        format.json { render :show, status: :ok, location: @employee_designation }
      else
        format.html { render :edit }
        format.json { render json: @employee_designation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee_designation.destroy
    respond_to do |format|
      format.html { redirect_to employee_designations_url, notice: 'Employee Designation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_designation
      @employee_designation = EmployeeDesignation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_designation_params
      params.require(:employee_designation).permit(:active, :employee_id, :designation_id, :start, :end)
    end
end
