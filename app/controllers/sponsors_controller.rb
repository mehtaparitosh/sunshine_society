class SponsorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  def index
    @sponsors = Sponsor.all
  end

  def show
    # @volunteer_sponsors = Volunteersponsor.where("sponsor_id = ?", params[:id])
  end

  def new
    @programs = Program.all
    @sponsor = Sponsor.new
  end

  def edit
    @programs = Program.all
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)

    respond_to do |format|
      if @sponsor.save
        @sponsor.sp_id = "SS-SP-#{@sponsor.id}"
        @sponsor.save
        format.html { redirect_to @sponsor, notice: 'Sponsor was successfully created.' }
        format.json { render :show, status: :created, location: @sponsor }
      else
        format.html { render :new }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sponsor.update(sponsor_params)
        format.html { redirect_to @sponsor, notice: 'Sponsor was successfully updated.' }
        format.json { render :show, status: :ok, location: @sponsor }
      else
        format.html { render :edit }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @sponsor.destroy
    respond_to do |format|
      format.html { redirect_to sponsors_url, notice: 'Sponsor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_params
      params.require(:sponsor).permit(:sp_id, :name, :gender, :dob, :doj, :contact, :email, :address, :country, :active, :dol, :pincode, :sponsor_type)
    end
end
