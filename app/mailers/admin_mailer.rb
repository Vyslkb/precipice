class AdminMailer < ActionMailer::Base
  default from: "Michael@BeyondThePrecipice.com"
  
  def welcome_email  
    mail(to: 'jamesmholst@yahoo.com, troutsnifferx@yahoo.com', subject: 'Testing Email Solution')
  end
  
  def order_confirmation(customer_order)
    @customer_order = customer_order 
    mail(to: 'jamesmholst@yahoo.com, troutsnifferx@yahoo.com', subject: 'Thank you for your order from Beyond The Precipice')
  end
  
  def forward_email(body)
    @body = body
    mail(to: 'jamesmholst@yahoo.com', subject: 'forwarded email')
  end
  
end
