class AdminMailer < ActionMailer::Base
  default from: "Michael@BeyondThePrecipice.com"
  
  def welcome_email  
    mail(to: 'jamesmholst@yahoo.com, troutsnifferx@yahoo.com', subject: 'Testing Email Solution')
  end
  
  def order_confirmation(customer_order)
    @customer_order = customer_order 
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
