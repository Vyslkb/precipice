class EmailProcessor
  def self.process(email)
    logger.error "!!!!!!!!!!!!!!!!!!!"
    logger.error email.body
    
    #Post.create!({ body: email.body, email: email.from })
  end
end