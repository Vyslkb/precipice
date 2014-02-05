class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy, :show_full_size]
  before_action :massage_gallery_order, only: :update
  before_action :print_option_params, only: [:update]
  before_filter :authenticate_admin!, only: [:index, :manage_slideshow, :update_slideshow, :new, :edit, :create, :update, :destroy]
  
  
  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.order_by_gallery
  end
  

  

  # GET /photos/1
  # GET /photos/1.json
  def show   
  end
  
  def manage_slideshow
    @photos = Photo.slideshow
  end
  
  def update_slideshow
     params[:photos].values.each do |photo_values|
        Photo.update(photo_values['id'], slideshow_order: photo_values['slideshow_order']) 
     end 
     
     redirect_to :back
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html {redirect_to photos_url}
        
        #if URI(request.referrer).path == "/photos/#{@photo.id}/edit" 
        #  format.html { redirect_to photos_url, notice: 'Photo was successfully updated.' }
        #else
        #  format.html { redirect_to request.referrer, notice: 'Photo was successfully updated.' }
        #end
       
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:name, 
                                    :description, 
                                    :gallery_id, 
                                    :active, 
                                    :paypal_identifier, 
                                    :photo_file,
                                    :gallery_order,
                                    :slideshow_flag,
                                    {print_option_ids: []},
                                    {photo_print_options_attributes:[:id,:print_option_id]})
    end
    
    def massage_gallery_order
      if params[:photo][:gallery_order].present?
        # If new position is lower than previous:
        # Subtract 1 from gallery order to ensure it falls ahead of the photo it is meant to replace.
        # If new position is higher than previous:  
        # Leave be to ensure it is lower (base1 index will be higher than base 0)
        # Gallery Controller will handle the re-order of the collection
        if params[:photo][:gallery_order].to_i <= @photo.gallery_order        
          params[:photo][:gallery_order] = params[:photo][:gallery_order].to_i - 1     
        else
          params[:photo][:gallery_order] = params[:photo][:gallery_order].to_i + 1 
        end
      end
    end
    
    def print_option_params
      checked_ids = params[:print_option_ids]
      checked_ids = [] if checked_ids.nil?
      
      #check existing records to see if they need to be destroyed
      @photo.photo_print_options.each do |photo_print_option|
        photo_print_option.destroy unless checked_ids.include?(photo_print_option.print_option_id)
      end
      
      #add new records
      checked_ids.each do |id|
        @photo.photo_print_options.new(print_option_id: id) unless @photo.print_option_ids.include?(id)
      end
    end    
    
    
    
end
