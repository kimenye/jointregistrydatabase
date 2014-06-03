class AnastheticTypesController < ApplicationController
  before_action :set_anasthetic_type, only: [:show, :edit, :update, :destroy]

  # GET /anasthetic_types
  # GET /anasthetic_types.json
  def index
    @anasthetic_types = AnastheticType.all
  end

  # GET /anasthetic_types/1
  # GET /anasthetic_types/1.json
  def show
  end

  # GET /anasthetic_types/new
  def new
    @anasthetic_type = AnastheticType.new
  end

  # GET /anasthetic_types/1/edit
  def edit
  end

  # POST /anasthetic_types
  # POST /anasthetic_types.json
  def create
    @anasthetic_type = AnastheticType.new(anasthetic_type_params)

    respond_to do |format|
      if @anasthetic_type.save
        format.html { redirect_to @anasthetic_type, notice: 'Anasthetic type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @anasthetic_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @anasthetic_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anasthetic_types/1
  # PATCH/PUT /anasthetic_types/1.json
  def update
    respond_to do |format|
      if @anasthetic_type.update(anasthetic_type_params)
        format.html { redirect_to @anasthetic_type, notice: 'Anasthetic type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @anasthetic_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anasthetic_types/1
  # DELETE /anasthetic_types/1.json
  def destroy
    @anasthetic_type.destroy
    respond_to do |format|
      format.html { redirect_to anasthetic_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anasthetic_type
      @anasthetic_type = AnastheticType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anasthetic_type_params
      params.require(:anasthetic_type).permit(:name, :surgery_id)
    end
end
