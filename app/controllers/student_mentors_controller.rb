class StudentMentorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_mentor, only: [:edit, :update, :destroy]

  def new
    @student = Student.find(params[:student_id])
    @students = Student.all
    @mentors = Mentor.all
    @student_mentor = StudentMentor.new
  end

  def edit
    @student = Student.find(params[:student_id])
    @students = Student.all
    @mentors = Mentor.all
  end

  def create
    @student_mentor = StudentMentor.new(student_mentor_params)

    respond_to do |format|
      if @student_mentor.save
        format.html { 
          @student = Student.find(@student_mentor.student_id)
          redirect_to @student, notice: 'Student Mentor was successfully created.' 
        }
        format.json { render :show, status: :created, location: @student_mentor }
      else
        format.html { render :new }
        format.json { render json: @student_mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student_mentor.update(student_mentor_params)
        format.html { 
          @student = Student.find(@student_mentor.student_id)
          redirect_to @student, notice: 'Student Mentor was successfully updated.' 
        }
        format.json { render :show, status: :ok, location: @student_mentor }
      else
        format.html { render :edit }
        format.json { render json: @student_mentor.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @student_mentor.destroy
    respond_to do |format|
      format.html { redirect_to student_mentors_url, notice: 'Student Mentor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_mentor
      @student_mentor = StudentMentor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_mentor_params
      params.require(:student_mentor).permit(:active, :student_id, :mentor_id)
    end
end
