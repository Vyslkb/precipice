class AdminMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def welcome_email  
    mail(to: 'jamesmholst@yahoo.com', subject: 'Welcome to My Awesome Site')
  end
  
  def order_confirmation(customer_order)
    @customer_order = customer_order 
    mail(to: 'jamesmholst@yahoo.com, troutsnifferx@yahoo.com', subject: 'Thank you for your order from Beyond The Precipice')
  end
  
end
