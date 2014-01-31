namespace :dev_tasks do

  desc "Regenerate slugs for photos, galleries, collections"
  task :generate_slugs  => :environment do
    Photo.find_each(&:save)
    Gallery.find_each(&:save)
    Collection.find_each(&:save)
  end

  desc "remove orphaned print options"
  task :clean_print_options => :environment do
    PhotoPrintOption.all.each do |photo_print_option|
      if PrintOption.where(id: photo_print_option.print_option_id).present?
        photo_print_option.destroy
      end
      
    end
  end

  
end