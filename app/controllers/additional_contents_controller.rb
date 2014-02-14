class AdditionalContentsController < ApplicationController
  before_action :set_additional_content, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
  
  # GET /additional_contents
  # GET /additional_contents.json
  def index
    @additional_contents = AdditionalContent.all
  end

  # GET /additional_contents/1
  # GET /additional_contents/1.json
  def show
  end

  # GET /additional_contents/new
  def new
    @additional_content = AdditionalContent.new
  end

  # GET /additional_contents/1/edit
  def edit
  end

  # POST /additional_contents
  # POST /additional_contents.json
  def create
    @additional_content = AdditionalContent.new(additional_content_params)

    respond_to do |format|
      if @additional_content.save
        format.html { redirect_to @additional_content, notice: 'Additional content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @additional_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @additional_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /additional_contents/1
  # PATCH/PUT /additional_contents/1.json
  def update
    respond_to do |format|
      if @additional_content.update(additional_content_params)
        format.html { redirect_to @additional_content, notice: 'Additional content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @additional_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_contents/1
  # DELETE /additional_contents/1.json
  def destroy
    @additional_content.destroy
    respond_to do |format|
      format.html { redirect_to additional_contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional_content
      @additional_content = AdditionalContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_content_params
      params.require(:additional_content).permit(:philosophy, :contact, :prints_and_pricing, :travel_quote)
    end
end
