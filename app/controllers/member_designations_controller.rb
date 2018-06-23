class MemberDesignationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member_designation, only: [:edit, :update, :destroy]

  def new
    if params[:member_id] 
      @member = Member.find(params[:member_id])
    elsif params[:designation_id] 
      @designation = Designation.find(params[:designation_id])
    else
    end  
    @members = Member.all
    @designations = Designation.all
    @member_designation = MemberDesignation.new
  end

  def edit
    if params[:member_id] 
      @member = Member.find(params[:member_id])
    elsif params[:designation_id] 
      @designation = Designation.find(params[:designation_id])
    else
    end
    @members = Member.all
    @designations = Designation.all
  end

  def create
    @member_designation = MemberDesignation.new(member_designation_params)

    respond_to do |format|
      if @member_designation.save
        format.html { 
          if params[:member_id] 
            @member = Member.find(@member_designation.member_id)
            redirect_to @member, notice: 'member designation was successfully created.'
          elsif params[:designation_id] 
            @designation = Designation.find(@member_designation.designation_id)
            redirect_to @designation, notice: 'member designation was successfully created.'
          else
            redirect_to root_path, notice: 'member designation was successfully created.'
          end 
        }
        format.json { render :show, status: :created, location: @member_designation }
      else
        format.html { render :new }
        format.json { render json: @member_designation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @member_designation.update(member_designation_params)
        format.html { 
          if params[:member_id] 
            @member = Member.find(@member_designation.member_id)
            redirect_to @member, notice: 'member designation was successfully updated.'
          elsif params[:designation_id] 
            @designation = Designation.find(@member_designation.designation_id)
            redirect_to @designation, notice: 'member designation was successfully updated.'
          else
            redirect_to root_path, notice: 'member designation was successfully updated.'
          end 
        }
        format.json { render :show, status: :ok, location: @member_designation }
      else
        format.html { render :edit }
        format.json { render json: @member_designation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @member_designation.destroy
    respond_to do |format|
      format.html { redirect_to member_designations_url, notice: 'Member Designation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_designation
      @member_designation = MemberDesignation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_designation_params
      params.require(:member_designation).permit(:active, :member_id, :designation_id)
    end
end
