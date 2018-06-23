class SponsorProgramsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_sponsor_program, only: [:edit, :update, :destroy]

  def new
    if params[:sponsor_id] 
      @sponsor = Sponsor.find(params[:sponsor_id])
    elsif params[:program_id] 
      @program = Program.find(params[:program_id])
    else
    end
    @sponsors = Sponsor.all
    @programs = Program.all
    @sponsor_program = SponsorProgram.new
  end

  def edit
    if params[:sponsor_id] 
      @sponsor = Sponsor.find(params[:sponsor_id])
    elsif params[:program_id] 
      @program = Program.find(params[:program_id])
    else
    end
    @sponsors = Sponsor.all
    @programs = Program.all
  end

  def create
    @sponsor_program = SponsorProgram.new(sponsor_program_params)

    respond_to do |format|
      if @sponsor_program.save
        format.html { 
          if params[:sponsor_id] 
            @sponsor = Sponsor.find(@sponsor_program.sponsor_id)
            redirect_to @sponsor, notice: 'sponsor program was successfully created.'
          elsif params[:program_id] 
            @program = Program.find(@sponsor_program.program_id)
            redirect_to @program, notice: 'sponsor program was successfully created.'
          else
            redirect_to root_path, notice: 'sponsor program was successfully created.'
          end 
        }
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
        format.html { 
          if params[:sponsor_id] 
            @sponsor = Sponsor.find(@sponsor_program.sponsor_id)
            redirect_to @sponsor, notice: 'sponsor program was successfully updated.'
          elsif params[:program_id] 
            @program = Program.find(@sponsor_program.program_id)
            redirect_to @program, notice: 'sponsor program was successfully updated.'
          else
            redirect_to root_path, notice: 'sponsor program was successfully updated.'
          end 
        }
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
