class SponsorProgramsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_sponsor_program, only: [:edit, :update, :destroy]

  def new
    @sponsors = Sponsor.all
    @programs = Program.all
    @sponsor_program = SponsorProgram.new
  end

  def edit
    @sponsors = Sponsor.all
    @programs = Program.all
  end

  def create
    @sponsor_program = SponsorProgram.new(sponsor_program_params)

    respond_to do |format|
      if @sponsor_program.save
        format.html { redirect_to @sponsor_program, notice: 'Sponsor Program was successfully created.' }
        format.json { render :show, status: :created, location: @sponsor_program }
      else
        format.html { render :new }
        format.json { render json: @sponsor_program.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sponsor_program.update(sponsor_program_params)
        format.html { redirect_to @sponsor_program, notice: 'Sponsor Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @sponsor_program }
      else
        format.html { render :edit }
        format.json { render json: @sponsor_program.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @sponsor_program.destroy
    respond_to do |format|
      format.html { redirect_to sponsor_programs_url, notice: 'Sponsor Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor_program
      @sponsor_program = SponsorProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_program_params
      params.require(:sponsor_program).permit(:active, :sponsor_id, :program_id)
    end
end
