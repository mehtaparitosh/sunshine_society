class StudentSponsorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student_sponsor, only: [:edit, :update, :destroy]

  def new
    if params[:student_id] 
      @student = Student.find(params[:student_id])
    elsif params[:sponsor_id] 
      @sponsor = Sponsor.find(params[:sponsor_id])
    else
    end
    @students = Student.all
    @sponsors = Sponsor.all
    @student_sponsor = StudentSponsor.new
  end

  def edit
    if params[:student_id] 
      @student = Student.find(params[:student_id])
    elsif params[:sponsor_id] 
      @sponsor = Sponsor.find(params[:sponsor_id])
    else
    end
    @students = Student.all
    @sponsors = Sponsor.all
  end

  def create
    @student_sponsor = StudentSponsor.new(student_sponsor_params)

    respond_to do |format|
      if @student_sponsor.save
        format.html { 
          if params[:student_id] 
            @student = Student.find(@student_sponsor.student_id)
            redirect_to @student, notice: 'Student sponsor was successfully created.'
          elsif params[:sponsor_id] 
            @sponsor = Sponsor.find(@student_sponsor.sponsor_id)
            redirect_to @sponsor, notice: 'Student sponsor was successfully created.'
          else
            redirect_to root_path, notice: 'Student sponsor was successfully created.'
          end   
        }
        format.json { render :show, status: :created, location: @student_sponsor }
      else
        format.html { render :new }
        format.json { render json: @student_sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student_sponsor.update(student_sponsor_params)
        format.html { 
          if params[:student_id] 
            @student = Student.find(@student_sponsor.student_id)
            redirect_to @student, notice: 'Student sponsor was successfully updated.'
          elsif params[:sponsor_id] 
            @sponsor = Sponsor.find(@student_sponsor.sponsor_id)
            redirect_to @sponsor, notice: 'Student sponsor was successfully updated.'
          else
            redirect_to root_path, notice: 'Student sponsor was successfully updated.'
          end 
        }
        format.json { render :show, status: :ok, location: @student_sponsor }
      else
        format.html { render :edit }
        format.json { render json: @student_sponsor.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @student_sponsor.destroy
    respond_to do |format|
      format.html { redirect_to student_sponsors_url, notice: 'Student Sponsor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_sponsor
      @student_sponsor = StudentSponsor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_sponsor_params
      params.require(:student_sponsor).permit(:active, :student_id, :sponsor_id, :academic_year, :sponsor_type)
    end
end
