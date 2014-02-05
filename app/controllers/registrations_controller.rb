class RegistrationsController < Devise::RegistrationsController
  before_action :close_signup, only: [:new]
  
  def close_signup
    if admin_signed_in?
      true
    else 
      redirect_to root_url
    end
    
  end
  
  
  def new
    super
  end

  def create
    super  # add custom create logic here
  end

  def edit
    super
  end

  def update
    super
  end
  
  def destroy
    super
  end
end 