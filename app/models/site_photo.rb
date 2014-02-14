class SitePhoto < ActiveRecord::Base
   has_attached_file :photo_file, :styles => { :medium => "250x250>", 
                                               :thumb => "100x100>", 
                                               :large => "500x500>",
                                               :original => "1400x1400>" },
                                               :convert_options => {:thumb => "-quality 60 -strip",
                                                                    :medium => "-quality 60 -strip",
                                                                    :large => "-quality 60 -strip",
                                                                    :original => "-quality 75" }, 
                                               :default_url => "/images/:style/missing.png"
   
  validates_attachment_content_type :photo_file, :content_type => %w(image/jpeg image/jpg image/png)
  



end
