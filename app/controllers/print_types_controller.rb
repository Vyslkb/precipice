class PrintTypesController < ApplicationController
  before_action :set_print_type, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!

  # GET /print_types
  # GET /print_types.json
  def index
    @print_types = PrintType.all
  end

  # GET /print_types/1
  # GET /print_types/1.json
  def show
  end

  # GET /print_types/new
  def new
    @print_type = PrintType.new
  end

  # GET /print_types/1/edit
  def edit
  end

  # POST /print_types
  # POST /print_types.json
  def create
    @print_type = PrintType.new(print_type_params)

    respond_to do |format|
      if @print_type.save
        format.html { redirect_to @print_type, notice: 'Print type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @print_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @print_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_types/1
  # PATCH/PUT /print_types/1.json
  def update
    respond_to do |format|
      if @print_type.update(print_type_params)
        format.html { redirect_to @print_type, notice: 'Print type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @print_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_types/1
  # DELETE /print_types/1.json
  def destroy
    @print_type.destroy
    respond_to do |format|
      format.html { redirect_to print_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_print_type
      @print_type = PrintType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def print_type_params
      params.require(:print_type).permit(:name, :display_order)
    end
end
