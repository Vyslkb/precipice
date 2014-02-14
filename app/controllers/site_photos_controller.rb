class SitePhotosController < ApplicationController
  before_action :set_site_photo, only: [:show, :edit, :update, :destroy]

  # GET /site_photos
  # GET /site_photos.json
  def index
    @site_photos = SitePhoto.all
  end

  # GET /site_photos/1
  # GET /site_photos/1.json
  def show
  end

  # GET /site_photos/new
  def new
    @site_photo = SitePhoto.new
  end

  # GET /site_photos/1/edit
  def edit
  end

  # POST /site_photos
  # POST /site_photos.json
  def create
    @site_photo = SitePhoto.new(site_photo_params)

    respond_to do |format|
      if @site_photo.save
        format.html { redirect_to @site_photo, notice: 'Site photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site_photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @site_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /site_photos/1
  # PATCH/PUT /site_photos/1.json
  def update
    respond_to do |format|
      if @site_photo.update(site_photo_params)
        format.html { redirect_to @site_photo, notice: 'Site photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_photos/1
  # DELETE /site_photos/1.json
  def destroy
    @site_photo.destroy
    respond_to do |format|
      format.html { redirect_to site_photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site_photo
      @site_photo = SitePhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_photo_params
      params.require(:site_photo).permit(:name, :photo_file)
    end
end
