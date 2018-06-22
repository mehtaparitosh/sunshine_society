class StudentCoordinatorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_coordinator, only: [:edit, :update, :destroy]

  def new
    @student = Student.find(params[:student_id])
    @students = Student.all
    @coordinators = Coordinator.all
    @student_coordinator = StudentCoordinator.new
  end


  def edit
    @student = Student.find(params[:student_id])
    @students = Student.all
    @coordinators = Coordinator.all
  end

  def create
    @student_coordinator = StudentCoordinator.new(student_coordinator_params)

    respond_to do |format|
      if @student_coordinator.save
        format.html { 
          @student = Student.find(@student_coordinator.student_id)
          redirect_to @student, notice: 'Student Coordinator was successfully created.' 
        }
        format.json { render :show, status: :created, location: @student_coordinator }
      else
        format.html { render :new }
        format.json { render json: @student_coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student_coordinator.update(student_coordinator_params)
        format.html { 
          @student = Student.find(@student_coordinator.student_id)
          redirect_to @student, notice: 'Student Coordinator was successfully updated.' 
        }
        format.json { render :show, status: :ok, location: @student_coordinator }
      else
        format.html { render :edit }
        format.json { render json: @student_coordinator.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @student_coordinator.destroy
    respond_to do |format|
      format.html { redirect_to student_coordinators_url, notice: 'Student Coordinator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_coordinator
      @student_coordinator = StudentCoordinator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_coordinator_params
      params.require(:student_coordinator).permit(:active, :student_id, :coordinator_id)
    end
end
