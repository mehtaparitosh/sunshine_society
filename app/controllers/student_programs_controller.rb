class StudentProgramsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_program, only: [:edit, :update, :destroy]

  def new
    if params[:student_id] 
      @student = Student.find(params[:student_id])
    elsif params[:program_id] 
      @program = Program.find(params[:program_id])
    else
    end
    @students = Student.all
    @programs = Program.all
    @student_program = StudentProgram.new
  end

  def edit
    if params[:student_id] 
      @student = Student.find(params[:student_id])
    elsif params[:program_id] 
      @program = Program.find(params[:program_id])
    else
    end
    @students = Student.all
    @programs = Program.all
  end

  def create
    @student_program = StudentProgram.new(student_program_params)

    respond_to do |format|
      if @student_program.save
        format.html { 
          if params[:student_id] 
            @student = Student.find(@student_program.student_id)
            redirect_to @student, notice: 'Student program was successfully created.'
          elsif params[:program_id] 
            @program = Program.find(@student_program.program_id)
            redirect_to @program, notice: 'Student program was successfully created.'
          else
            redirect_to root_path, notice: 'Student program was successfully created.'
          end   
        }
        format.json { render :show, status: :created, location: @student_program }
      else
        format.html { render :new }
        format.json { render json: @student_program.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student_program.update(student_program_params)
        format.html { 
          if params[:student_id] 
            @student = Student.find(@student_program.student_id)
            redirect_to @student, notice: 'Student program was successfully updated.'
          elsif params[:program_id] 
            @program = Program.find(@student_program.program_id)
            redirect_to @program, notice: 'Student program was successfully updated.'
          else
            redirect_to root_path, notice: 'Student program was successfully updated.'
          end    
        }
        format.json { render :show, status: :ok, location: @student_program }
      else
        format.html { render :edit }
        format.json { render json: @student_program.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @student_program.destroy
    respond_to do |format|
      format.html { redirect_to student_programs_url, notice: 'Student Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_program
      @student_program = StudentProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_program_params
      params.require(:student_program).permit(:active, :student_id, :program_id)
    end
end
