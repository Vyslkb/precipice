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
  
  
end
