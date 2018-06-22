class StudentVolunteersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_volunteer, only: [:edit, :update, :destroy]

  def new
    @student = Student.find(params[:student_id])
    @students = Student.all
    @volunteers = Volunteer.all
    @student_volunteer = StudentVolunteer.new
  end

  def edit
    @student = Student.find(params[:student_id])
    @students = Student.all
    @volunteers = Volunteer.all
  end

  def create
    @student_volunteer = StudentVolunteer.new(student_volunteer_params)

    respond_to do |format|
      if @student_volunteer.save
        format.html { 
          @student = Student.find(@student_volunteer.student_id)
          redirect_to @student, notice: 'Student Volunteer was successfully created.' 
        }
        format.json { render :show, status: :created, location: @student_volunteer }
      else
        format.html { render :new }
        format.json { render json: @student_volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student_volunteer.update(student_volunteer_params)
        format.html { 
          @student = Student.find(@student_volunteer.student_id)
          redirect_to @student, notice: 'Student Volunteer was successfully updated.' 
        }
        format.json { render :show, status: :ok, location: @student_volunteer }
      else
        format.html { render :edit }
        format.json { render json: @student_volunteer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @student_volunteer.destroy
    respond_to do |format|
      format.html { redirect_to student_volunteers_url, notice: 'Student Volunteer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_volunteer
      @student_volunteer = StudentVolunteer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_volunteer_params
      params.require(:student_volunteer).permit(:active, :student_id, :volunteer_id)
    end
end
