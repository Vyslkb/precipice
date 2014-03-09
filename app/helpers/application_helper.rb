require 'fastimage'

module ApplicationHelper
  
  
  def static_page_name
    if controller_name == "pages"
      static_page_name = params[:id]
    else 
      static_page_name = "na"
    end
    
    static_page_name
  end
  
  def set_background_image
    site_photo_name = "default_background"
    
    if @photo
      if @photo.try(:gallery).try(:collection).try(:name) == "Wedding"
        site_photo_name = "wedding_background"  
      elsif  
        @photo.try(:gallery).try(:collection).try(:name) == "People"
        site_photo_name = "portrait_background"
      end
    end
    
    if @gallery
      if @gallery.try(:collection).try(:name) == "Wedding"
        site_photo_name = "wedding_background"  
      elsif  
        @gallery.try(:collection).try(:name) == "People"
        site_photo_name = "portrait_background"
      end
    end
    
    if @collection
      if @collection.name == "Wedding"
        site_photo_name = "wedding_background"  
      elsif  
        @collection.name == "People"
        site_photo_name = "portrait_background"
      end
    end
    unless static_page_name == "home"
      image_tag(SitePhoto.find_by_name(site_photo_name).photo_file.url(:original))  
    end
    
  end
  
  
  def facebook_share_button
    if static_page_name == "home" || (controller_name == "photos" && action_name == "show" )
      content_tag(:div, "", class: "fb-share-button horz-padding", data: {href: request.original_url, type: "button" })
    end
  end
  
  def open_graph_values
    og = {}
    
    
      og[:title] = "Beyond The Precipice"
      og[:url] = "http://www.beyondtheprecipice.com"
      og[:site_name] = "Beyond The Precipice"
      og[:description] = "Fine Art Photography"
      og[:type] = "website"
      og[:image] = "#{request.protocol}#{request.host_with_port}#{asset_path('fb_share_logo.png')}"
      og[:image_type] = "image/png"
      og[:image_width] = "1388"
      og[:image_height] = "729"
      
      
      
    if controller_name == "photos"
      if action_name == "show"
        
        og[:title] = "Beyond The Precipice"
        og[:url] = "#{request.protocol}#{request.host_with_port}#{photo_path(@photo)}"
        og[:site_name] = "Beyond The Precipice"
        og[:description] = "Fine Art Photography - #{@photo.name}"
        og[:type] = "website"
        og[:image] = @photo.photo_file.url(:original)
        og[:image_type] = "image/jpg"
        
        if Rails.env.production?
          og[:image_width] = FastImage.size(@photo.photo_file.url(:original))[0]
          og[:image_height] = FastImage.size(@photo.photo_file.url(:original))[1]
        end
      end
    end
  
    og  
  end
  
  
end
