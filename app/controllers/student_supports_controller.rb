class StudentSupportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_support, only: [:edit, :update, :destroy]

  def new
    if params[:student_id] 
      @student = Student.find(params[:student_id])
    elsif params[:support_id] 
      @support = Support.find(params[:support_id])
    else
    end  
    @students = Student.all
    @supports = Support.all
    @student_support = StudentSupport.new
  end

  def edit
    if params[:student_id] 
      @student = Student.find(params[:student_id])
    elsif params[:support_id] 
      @support = Support.find(params[:support_id])
    else
    end
    @students = Student.all
    @supports = Support.all
  end

  def create
    @student_support = StudentSupport.new(student_support_params)

    respond_to do |format|
      if @student_support.save
        format.html { 
          if params[:student_id] 
            @student = Student.find(@student_support.student_id)
            redirect_to @student, notice: 'Student support was successfully created.'
          elsif params[:support_id] 
            @support = Support.find(@student_support.support_id)
            redirect_to @support, notice: 'Student support was successfully created.'
          else
            redirect_to root_path, notice: 'Student support was successfully created.'
          end  
        }
        format.json { render :show, status: :created, location: @student_support }
      else
        format.html { render :new }
        format.json { render json: @student_support.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student_support.update(student_support_params)
        format.html { 
          if params[:student_id] 
            @student = Student.find(@student_support.student_id)
            redirect_to @student, notice: 'Student support was successfully updated.'
          elsif params[:support_id] 
            @support = Support.find(@student_support.support_id)
            redirect_to @support, notice: 'Student support was successfully updated.'
          else
            redirect_to root_path, notice: 'Student support was successfully updated.'
          end  
        }
        format.json { render :show, status: :ok, location: @student_support }
      else
        format.html { render :edit }
        format.json { render json: @student_support.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @student_support.destroy
    respond_to do |format|
      format.html { redirect_to student_supports_url, notice: 'Student Support was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_support
      @student_support = StudentSupport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_support_params
      params.require(:student_support).permit(:active, :student_id, :support_id)
    end
end
