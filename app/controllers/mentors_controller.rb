class MentorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mentor, only: [:show, :edit, :update, :destroy]

  def index
    @mentors = Mentor.all
  end

  def show
    @student_mentors = StudentMentor.where("mentor_id = ?", params[:id])
    # @volunteer_mentors = Volunteermentor.where("mentor_id = ?", params[:id])
  end

  def new
    @mentor = Mentor.new
  end

  def edit
  end

  def create
    @mentor = Mentor.new(mentor_params)

    respond_to do |format|
      if @mentor.save
        @mentor.men_id = "SS-MEN-#{@mentor.id}"
        @mentor.save
        format.html { redirect_to @mentor, notice: 'Mentor was successfully created.' }
        format.json { render :show, status: :created, location: @mentor }
      else
        format.html { render :new }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mentor.update(mentor_params)
        format.html { redirect_to @mentor, notice: 'Mentor was successfully updated.' }
        format.json { render :show, status: :ok, location: @mentor }
      else
        format.html { render :edit }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @mentor.destroy
    respond_to do |format|
      format.html { redirect_to mentors_url, notice: 'Mentor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentor
      @mentor = Mentor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mentor_params
      params.require(:mentor).permit(:men_id, :name, :gender, :dob, :doj, :contact, :email, :address, :country, :active, :dol, :pincode)
    end
end
