class WorkplacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workplace, only: [:show, :edit, :update, :destroy]

  def index
    @workplaces = Workplace.all
  end

  def show
    @employee_workplaces = EmployeeWorkplace.where("workplace_id = ?", params[:id])

  end

  def new
    @workplace = Workplace.new
  end

  def edit
  end

  def create
    @workplace = Workplace.new(workplace_params)

    respond_to do |format|
      if @workplace.save
        format.html { redirect_to @workplace, notice: 'Workplace was successfully created.' }
        format.json { render :show, status: :created, location: @workplace }
      else
        format.html { render :new }
        format.json { render json: @workplace.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @workplace.update(workplace_params)
        format.html { redirect_to @workplace, notice: 'Workplace was successfully updated.' }
        format.json { render :show, status: :ok, location: @workplace }
      else
        format.html { render :edit }
        format.json { render json: @workplace.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @workplace.destroy
    respond_to do |format|
      format.html { redirect_to workplaces_url, notice: 'Workplace was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workplace
      @workplace = Workplace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workplace_params
      params.require(:workplace).permit(:name, :address, :contact, :comments)
    end
end
