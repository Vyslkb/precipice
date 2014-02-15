class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!, only: [:index, :new, :edit, :create, :update, :destroy]
  
  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    if @collection.galleries.count == 1
      redirect_to @collection.galleries.first
    end
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to collections_url, notice: 'Collection was successfully created.' }
        format.json { render action: 'show', status: :created, location: @collection }
      else
        format.html { render action: 'new' }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to collections_url, notice: 'Collection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit_display_order
    @collections = Collection.all
  end
  
  def update_display_order
     params[:collections].values.each do |collection_values|
        Collection.update(collection_values['id'], display_order: collection_values['display_order']) 
     end 
     
     redirect_to collections_path
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:name, :for_sale_flag, galleries_attributes: [:id, :name,:order_in_collection])
    end
end
