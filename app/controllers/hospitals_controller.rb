class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  # GET /hospitals
  # GET /hospitals.json
  def index
    @hospitals = Hospital.all
  end

  # GET /hospitals/1
  # GET /hospitals/1.json
  def show
  end

  # GET /hospitals/new
  def new
    @hospital = Hospital.new
  end

  # GET /hospitals/1/edit
  def edit
  end

  # POST /hospitals
  # POST /hospitals.json
  def create
    @hospital = Hospital.new(hospital_params)
    @hospital.approved = false

    respond_to do |format|
      if @hospital.save
        SuperAdminMailer.hospital_approval(@hospital).deliver
        format.html { redirect_to hospitals_path, notice: 'Hospital was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hospital }
      else
        format.html { render hospitals_path }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospitals/1
  # PATCH/PUT /hospitals/1.json
  def update
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to @hospital, notice: 'Hospital was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitals/1
  # DELETE /hospitals/1.json
  def destroy
    @hospital.destroy
    respond_to do |format|
      format.html { redirect_to hospitals_url }
      format.json { head :no_content }
    end
  end

  def approve_hospitals
    @hospital = Hospital.find(params[:id])
    @hospital.approved = !@hospital.approved
    @hospital.save!
    redirect_to hospitals_path, notice: "hospital has been approved!"
    # if @hospital.approved
    #   SuperAdminMailer.hospital_approval_notification(@hospital).deliver
    #   redirect_to hospitals_path, notice: "hospital has been approved!"
    # else
    #   SuperAdminMailer.hospital_unapproval_notification(@hospital).deliver
    #   redirect_to hospitals_path, notice: "hospital has been unapproved!"
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_params
      params.require(:hospital).permit(:name, :location, :website, :email, :approved, :logo)
    end
end
