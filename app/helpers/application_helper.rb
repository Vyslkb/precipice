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
    image_name = "background.jpg"
    
    if @photo
      if @photo.try(:gallery).try(:collection).try(:name) == "Wedding"
        image_name = "wedding_background.jpg"  
      elsif  
        @photo.try(:gallery).try(:collection).try(:name) == "Portrait"
        image_name = "portrait_background.jpg"
      end
    end
    
    if @gallery
      if @gallery.try(:collection).try(:name) == "Wedding"
        image_name = "wedding_background.jpg"  
      elsif  
        @gallery.try(:collection).try(:name) == "Portrait"
        image_name = "portrait_background.jpg"
      end
    end
    
    if @collection
      if @collection.name == "Wedding"
        image_name = "wedding_background.jpg"  
      elsif  
        @collection.name == "Portrait"
        image_name = "portrait_background.jpg"
      end
    end
    
    image_tag(image_name)  unless static_page_name == "home"
    
  end
end
