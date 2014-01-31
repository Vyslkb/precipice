namespace :dev_tasks do

  desc "Regenerate slugs for photos, galleries, collections"
  task :generate_slugs  => :environment do
    Photo.find_each(&:save)
    Gallery.find_each(&:save)
    Collection.find_each(&:save)
  end

  desc "remove orphaned print options"
  task :clean_print_options => :environment do
    PrintOption.destroy_all
    PhotoPrintOption.destroy_all
    
  end

  
end