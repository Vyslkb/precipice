class EmailProcessor
  def self.process(email)
    logger.error "!!!!!!!!!!!!!!!!!!!"
    logger.error email.body
    AdminMailer.forward_email(email.body).deliver
    #Post.create!({ body: email.body, email: email.from })
  end
end