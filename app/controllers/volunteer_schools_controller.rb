class VolunteerSchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_volunteer_school, only: [:edit, :update, :destroy]

  def new
    if params[:volunteer_id] 
      @volunteer = Volunteer.find(params[:volunteer_id])
    elsif params[:school_id] 
      @school = School.find(params[:school_id])
    else
    end
    @volunteers = Volunteer.all
    @schools = School.all
    @volunteer_school = VolunteerSchool.new
  end

  def edit
    if params[:volunteer_id] 
      @volunteer = Volunteer.find(params[:volunteer_id])
    elsif params[:school_id] 
      @school = School.find(params[:school_id])
    else
    end
    @volunteers = Volunteer.all
    @schools = School.all
  end

  def create
    @volunteer_school = VolunteerSchool.new(volunteer_school_params)

    respond_to do |format|
      if @volunteer_school.save
        format.html { 
          if params[:volunteer_id] 
            @volunteer = Volunteer.find(@volunteer_school.volunteer_id)
            redirect_to @volunteer, notice: 'volunteer school was successfully created.'
          elsif params[:school_id] 
            @school = School.find(@volunteer_school.school_id)
            redirect_to @school, notice: 'volunteer school was successfully created.'
          else
            redirect_to root_path, notice: 'volunteer school was successfully created.'
          end 
        }
        format.json { render :show, status: :created, location: @volunteer_school }
      else
        format.html { render :new }
        format.json { render json: @volunteer_school.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @volunteer_school.update(volunteer_school_params)
        format.html { 
          if params[:volunteer_id] 
            @volunteer = Volunteer.find(@volunteer_school.volunteer_id)
            redirect_to @volunteer, notice: 'volunteer school was successfully updated.'
          elsif params[:school_id] 
            @school = School.find(@volunteer_school.school_id)
            redirect_to @school, notice: 'volunteer school was successfully updated.'
          else
            redirect_to root_path, notice: 'volunteer school was successfully updated.'
          end 
        }
        format.json { render :show, status: :ok, location: @volunteer_school }
      else
        format.html { render :edit }
        format.json { render json: @volunteer_school.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @volunteer_school.destroy
    respond_to do |format|
      format.html { redirect_to volunteer_schools_url, notice: 'Volunteer School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer_school
      @volunteer_school = VolunteerSchool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_school_params
      params.require(:volunteer_school).permit(:active, :volunteer_id, :school_id)
    end
end
