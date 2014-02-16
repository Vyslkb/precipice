class EmailProcessor
  def self.process(email)
    
    AdminMailer.forward_email(email).deliver
    #Post.create!({ body: email.body, email: email.from })
  end
end