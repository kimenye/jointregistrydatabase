class MechanicalsController < ApplicationController
  before_action :set_mechanical, only: [:show, :edit, :update, :destroy]

  # GET /mechanicals
  # GET /mechanicals.json
  def index
    @mechanicals = Mechanical.all
  end

  # GET /mechanicals/1
  # GET /mechanicals/1.json
  def show
  end

  # GET /mechanicals/new
  def new
    @mechanical = Mechanical.new
  end

  # GET /mechanicals/1/edit
  def edit
  end

  # POST /mechanicals
  # POST /mechanicals.json
  def create
    @mechanical = Mechanical.new(mechanical_params)

    respond_to do |format|
      if @mechanical.save
        format.html { redirect_to @mechanical, notice: 'Mechanical was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mechanical }
      else
        format.html { render action: 'new' }
        format.json { render json: @mechanical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mechanicals/1
  # PATCH/PUT /mechanicals/1.json
  def update
    respond_to do |format|
      if @mechanical.update(mechanical_params)
        format.html { redirect_to @mechanical, notice: 'Mechanical was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mechanical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mechanicals/1
  # DELETE /mechanicals/1.json
  def destroy
    @mechanical.destroy
    respond_to do |format|
      format.html { redirect_to mechanicals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mechanical
      @mechanical = Mechanical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mechanical_params
      params.require(:mechanical).permit(:name, :surgery_id)
    end
end
