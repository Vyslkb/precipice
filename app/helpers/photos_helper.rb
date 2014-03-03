module PhotosHelper
  def generate_grouped_options
    grouped_options = []
    @photo.print_types.distinct.each do |print_type|
      grouped_options += [
        [print_type.name,
          print_type.photo_print_options_for_photo(@photo).map{ |x| [x.print_option_name_and_price, x.id] }  
        ]
      ]
    end
    
    grouped_options
  end
   
end
