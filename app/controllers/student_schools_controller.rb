class StudentSchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_school, only: [:edit, :update, :destroy]

  def new
    @student = Student.find(params[:student_id])
    @students = Student.all
    @schools = School.all
    @student_school = StudentSchool.new
  end

  def edit
    @student = Student.find(params[:student_id])
    @students = Student.all
    @schools = School.all
  end

  def create
    @student_school = StudentSchool.new(student_school_params)

    respond_to do |format|
      if @student_school.save
        format.html { 
          @student = Student.find(@student_school.student_id)
          redirect_to @student, notice: 'Student School was successfully created.' 
        }
        format.json { render :show, status: :created, location: @student_school }
      else
        format.html { render :new }
        format.json { render json: @student_school.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student_school.update(student_school_params)
        format.html { 
          @student = Student.find(@student_school.student_id)
          redirect_to @student_school, notice: 'Student School was successfully updated.' 
        }
        format.json { render :show, status: :ok, location: @student_school }
      else
        format.html { render :edit }
        format.json { render json: @student_school.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @student_school.destroy
    respond_to do |format|
      format.html { redirect_to student_schools_url, notice: 'Student School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_school
      @student_school = StudentSchool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_school_params
      params.require(:student_school).permit(:active, :student_id, :school_id, :time_period, :academic_period, :fees)
    end
end
