        
namespace :dev_tasks do

  desc "Regenerate slugs for photos, galleries, collections"
  task :generate_slugs  => :environment do
    Photo.find_each(&:save)
    Gallery.find_each(&:save)
    Collection.find_each(&:save)
  end

  desc "test gmail account"
  task :test_email => :environment do
     AdminMailer.welcome_email.deliver
  end
  
  task :generate_large_thumbnails => :environment do
    Photo.all.each do |photo|
      photo.photo_file.reprocess! :large
    end
  end
  

end