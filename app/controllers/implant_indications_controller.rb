class ImplantIndicationsController < ApplicationController
  before_action :set_implant_indication, only: [:show, :edit, :update, :destroy]

  # GET /implant_indications
  # GET /implant_indications.json
  def index
    @implant_indications = ImplantIndication.all
  end

  # GET /implant_indications/1
  # GET /implant_indications/1.json
  def show
  end

  # GET /implant_indications/new
  def new
    @implant_indication = ImplantIndication.new
  end

  # GET /implant_indications/1/edit
  def edit
  end

  # POST /implant_indications
  # POST /implant_indications.json
  def create
    @implant_indication = ImplantIndication.new(implant_indication_params)

    respond_to do |format|
      if @implant_indication.save
        format.html { redirect_to @implant_indication, notice: 'Implant indication was successfully created.' }
        format.json { render action: 'show', status: :created, location: @implant_indication }
      else
        format.html { render action: 'new' }
        format.json { render json: @implant_indication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /implant_indications/1
  # PATCH/PUT /implant_indications/1.json
  def update
    respond_to do |format|
      if @implant_indication.update(implant_indication_params)
        format.html { redirect_to @implant_indication, notice: 'Implant indication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @implant_indication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /implant_indications/1
  # DELETE /implant_indications/1.json
  def destroy
    @implant_indication.destroy
    respond_to do |format|
      format.html { redirect_to implant_indications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_implant_indication
      @implant_indication = ImplantIndication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def implant_indication_params
      params.require(:implant_indication).permit(:name, :surgery_id)
    end
end
