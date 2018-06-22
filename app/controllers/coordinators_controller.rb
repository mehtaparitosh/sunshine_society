class CoordinatorsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_coordinator, only: [:show, :edit, :update, :destroy]

  def index
    @coordinators = Coordinator.all
  end

  def show
    # @volunteer_coordinators = Volunteercoordinator.where("coordinator_id = ?", params[:id])
  end

  def new
    @coordinator = Coordinator.new
  end

  def edit
  end

  def create
    @coordinator = Coordinator.new(coordinator_params)

    respond_to do |format|
      if @coordinator.save
        @coordinator.co_id = "SS-CO-#{@coordinator.id}"
        @coordinator.save
        format.html { redirect_to @coordinator, notice: 'Coordinator was successfully created.' }
        format.json { render :show, status: :created, location: @coordinator }
      else
        format.html { render :new }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @coordinator.update(coordinator_params)
        format.html { redirect_to @coordinator, notice: 'Coordinator was successfully updated.' }
        format.json { render :show, status: :ok, location: @coordinator }
      else
        format.html { render :edit }
        format.json { render json: @coordinator.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @coordinator.destroy
    respond_to do |format|
      format.html { redirect_to coordinators_url, notice: 'Coordinator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coordinator
      @coordinator = Coordinator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coordinator_params
      params.require(:coordinator).permit(:co_id, :name, :gender, :dob, :doj, :contact, :email, :address, :country, :active, :dol, :pincode)
    end
end
