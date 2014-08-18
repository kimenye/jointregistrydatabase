class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_filter :can_view_patient?, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_hospital_admin!
  before_filter :authenticate_user!

  # GET /patients
  # GET /patients.json
  def index
    # if can? :see_all, Patient 
    #   @patients = Patient.all
    # else
    #   @patients = Patient.where(user_id: current_user.id)
    # end
    @patients = Patient.where(user_id: current_user.id)
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id

    respond_to do |format|
      if @patient.save
        format.html { redirect_to "#{new_surgery_path}?patient_name=#{@patient.name}&patient_id=#{@patient.id}", notice: 'Patient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
      # @patient = Patient.where(id: params[:id], user_id: current_user.id).first
    end

    def can_view_patient?
      patient = Patient.where(id: params[:id], user_id: current_user.id).first
      unless !patient.nil? || current_user.user_type == "SuperAdmin"
        redirect_to patients_path, alert: "You are not allowed to view this patient!"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:medical_record_number, :name, :date_of_birth, :gender, :weight, :height, :race, :postcode, :nhif_number)
    end
end
