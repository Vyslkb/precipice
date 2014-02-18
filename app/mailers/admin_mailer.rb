class AdminMailer < ActionMailer::Base
  require 'open-uri'
  
  default from: "Michael@BeyondThePrecipice.com"
  
  def welcome_email  
    tmp_file = open(SitePhoto.find_by_name("site_logo").photo_file.url(:original))
    
    #SitePhoto.find_by_name("site_logo").photo_file.url(:original))
    attachments.inline['logo.png'] = File.read(tmp_file)
    tmp_file.close
    tmp_file.unlink   # deletes the temp file
    
    mail(to: 'jamesmholst@yahoo.com', subject: 'Testing Email Solution')
  end
  
  def order_confirmation(customer_order)
    @customer_order = customer_order 
    
    tmp_file = open(SitePhoto.find_by_name('site_logo').photo_file.url(:large)).tempfile
    attachments.inline['logo.png'] = File.read(tmp_file)
    tmp_file.close
    tmp_file.unlink   # deletes the temp file
    
    
    mail(to: 'jamesmholst@yahoo.com, troutsnifferx@yahoo.com', subject: 'Thank you for your order from Beyond The Precipice')
  end
  
  def forward_email(email)
    @email = email
    
    email.attachments.each do |attachment|
      tmp_file = attachment.tempfile
      attachments[attachment.original_filename] = File.read(tmp_file)
      tmp_file.close
      tmp_file.unlink   # deletes the temp file
    end
    
    
    mail(to: 'jamesmholst@yahoo.com, troutsnifferx@yahoo.com', subject: email.subject)
  end
  
end
