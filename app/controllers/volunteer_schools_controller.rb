class VolunteerSchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_volunteer_school, only: [:edit, :update, :destroy]

  def new
    @volunteers = Volunteer.all
    @schools = School.all
    @volunteer_school = VolunteerSchool.new
  end

  def edit
    @volunteers = Volunteer.all
    @schools = School.all
  end

  def create
    @volunteer_school = VolunteerSchool.new(volunteer_school_params)

    respond_to do |format|
      if @volunteer_school.save
        format.html { redirect_to @volunteer_school, notice: 'Volunteer School was successfully created.' }
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
        format.html { redirect_to @volunteer_school, notice: 'Volunteer School was successfully updated.' }
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
