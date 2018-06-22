class SupportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_support, only: [:show, :edit, :update, :destroy]

  def index
    @supports = Support.all
  end

  def show
    # @volunteer_supports = Volunteersupport.where("support_id = ?", params[:id])
  end

  def new
    @support = Support.new
  end

  def edit
  end

  def create
    @support = Support.new(support_params)

    respond_to do |format|
      if @support.save
        format.html { redirect_to @support, notice: 'After School Support was successfully created.' }
        format.json { render :show, status: :created, location: @support }
      else
        format.html { render :new }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @support.update(support_params)
        format.html { redirect_to @support, notice: 'After School Support was successfully updated.' }
        format.json { render :show, status: :ok, location: @support }
      else
        format.html { render :edit }
        format.json { render json: @support.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @support.destroy
    respond_to do |format|
      format.html { redirect_to supports_url, notice: 'After School Support was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_support
      @support = Support.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def support_params
      params.require(:support).permit(:name, :address, :contact, :comments)
    end
end
