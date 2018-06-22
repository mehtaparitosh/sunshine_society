class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
    @student_coordinators = StudentCoordinator.where("student_id = ?", params[:id])
    @student_mentors = StudentMentor.where("student_id = ?", params[:id])
    @student_programs = StudentProgram.where("student_id = ?", params[:id])
    @student_schools = StudentSchool.where("student_id = ?", params[:id])
    @student_sponsors = StudentSponsor.where("student_id = ?", params[:id])
    @student_supports = StudentSupport.where("student_id = ?", params[:id])
    @student_volunteers = StudentVolunteer.where("student_id = ?", params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        @student.st_id = "SS-ST-#{@student.id}"
        @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:st_id, :name, :gender, :dob, :doj, :contact_1, :contact_2, :contact_3, :email, :address, :country, :pincode,
                                        :grade, :active, :fathers_name, :fathers_occupation, :mothers_name, :mothers_occupation, :society, :category, :dol)
    end

end
