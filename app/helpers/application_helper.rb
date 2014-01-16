module ApplicationHelper
  def static_page_name
    if controller_name == "pages"
      static_page_name = params[:id]
    else 
      static_page_name = "na"
    end
    
    static_page_name
  end

end
