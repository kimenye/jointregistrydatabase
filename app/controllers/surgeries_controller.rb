class SurgeriesController < ApplicationController
  before_action :set_surgery, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_hospital_admin!
  before_filter :can_view_surgery?, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /surgeries
  # GET /surgeries.json
  def index
    if can? :see_all, Surgery 
      @surgeries = Surgery.all
    else
      @surgeries = Surgery.where(user_id: current_user)
    end
  end

  # GET /surgeries/1
  # GET /surgeries/1.json
  def show
  end

  # GET /surgeries/new
  def new
    @surgery = Surgery.new
    # @indications = ImplantIndication.all
    # @knee_complications = InterOperativeComplication.where(complication_type: "Knee")
    # @hip_complications = InterOperativeComplication.where(complication_type: "Hip")
  end

  # GET /surgeries/1/edit
  def edit
  end

  # GET /surgeries/get_sizes?implant_id=?
  def get_sizes
    @implant = Implant.find(params[:implant_id])

    respond_to do |format|
      # format.json { render json: { implants: @implant.dimensions }}
      # format.json { partial! "get_sizes" }
      format.json { render partial: 'surgeries/get_sizes' } 
    end
  end

  # POST /surgeries
  # POST /surgeries.json
  def create
    @surgery = Surgery.new(surgery_params)
    @surgery.user_id = current_user.id

    respond_to do |format|
      if @surgery.save!
        format.html { redirect_to @surgery, notice: 'Surgery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @surgery }

        chemical = Chemical.find(params["chemical"]["chemical_id"])
        ChemicalsUsed.create! surgery_id: @surgery.id, chemical_id: chemical.id

        mechanical = Mechanical.find(params["mechanical"]["mechanical_id"])
        MechanicalsUsed.create! surgery_id: @surgery.id, mechanical_id: mechanical.id

        anasthetic_type = AnastheticType.find(params["anasthetic_type"]["anasthetic_type_id"])
        AnastheticsUsed.create! surgery_id: @surgery.id, anasthetic_type_id: anasthetic_type.id

        procedure = PatientProcedure.find(params["patient_procedure"]["patient_procedure_id"])
        ProceduresUsed.create! surgery_id: @surgery.id, patient_procedure_id: procedure.id

        indications = params["indications"]
        if !indications.nil?
          indications.each do |implant_indication|
            i_indication = ImplantIndication.find_by_name(implant_indication)
            ImplantIndicationSurgery.create! surgery_id: @surgery.id, implant_indication_id: i_indication.id
          end
        end
        
        # manufacturer = Manufacturer.find(params["manufacturer"]["manufacturer_id"])
        implant = Implant.find(params["implant"]["implant_id"])

        implant.dimensions.each do |dimension|
          implants_used = ImplantsUsed.new
          implants_used.surgery_id = @surgery.id
          implants_used.manufacturer_id = implant.manufacturer.id
          implants_used.implant_id = implant.id
          implants_used.dimension_id = dimension.id
          implants_used.implant_size_id = ImplantSize.where(measurement: params["dimension"]["#{implant.dimensions.index(dimension)}"], dimension_id: dimension.id).first.id if !params["dimension"].nil?
          implants_used.save!
        end
        params["complications"].each do |complication|
          inter_operative_complication = InterOperativeComplication.find_by_name(complication)
          SurgeryComplication.create! surgery_id: @surgery.id, inter_operative_complication_id: inter_operative_complication.id
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @surgery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surgeries/1
  # PATCH/PUT /surgeries/1.json
  def update
    respond_to do |format|
      if @surgery.update(surgery_params)
        format.html { redirect_to @surgery, notice: 'Surgery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @surgery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surgeries/1
  # DELETE /surgeries/1.json
  def destroy
    @surgery.destroy
    respond_to do |format|
      format.html { redirect_to surgeries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surgery
      @surgery = Surgery.find(params[:id])
    end

    def can_view_surgery?
      surgery = Surgery.where(id: params[:id], user_id: current_user.id).first
      unless !surgery.nil? || current_user.user_type == "SuperAdmin"
        redirect_to surgeries_path, alert: "You are not allowed to view this surgery!"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surgery_params
      params.require(:surgery).permit(:patient_id, :surgeon_id, :date_of_surgery, :side, :anasthetic_type_id, :chemical_id, :mechanical_id, :implant_indication_id, :patient_position, :total_hip_approach, :hospital_id)
    end
end
