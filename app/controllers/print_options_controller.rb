class PrintOptionsController < ApplicationController
  before_action :set_print_option, only: [:show, :edit, :update, :destroy]

  # GET /print_options
  # GET /print_options.json
  def index
    @print_options = PrintOption.all
  end

  # GET /print_options/1
  # GET /print_options/1.json
  def show
  end

  # GET /print_options/new
  def new
    @print_option = PrintOption.new
  end

  # GET /print_options/1/edit
  def edit
  end

  # POST /print_options
  # POST /print_options.json
  def create
    @print_option = PrintOption.new(print_option_params)

    respond_to do |format|
      if @print_option.save
        format.html { redirect_to print_options_path, notice: 'Print option was successfully created.' }
        format.json { render action: 'show', status: :created, location: @print_option }
      else
        format.html { render action: 'new' }
        format.json { render json: @print_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_options/1
  # PATCH/PUT /print_options/1.json
  def update
    respond_to do |format|
      if @print_option.update(print_option_params)
        format.html { redirect_to print_options_path, notice: 'Print option was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @print_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_options/1
  # DELETE /print_options/1.json
  def destroy
    @print_option.destroy
    respond_to do |format|
      format.html { redirect_to print_options_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_print_option
      @print_option = PrintOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def print_option_params
      params.require(:print_option).permit(:name, :price)
    end
end
