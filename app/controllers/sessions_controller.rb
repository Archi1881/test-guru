class SessionsController < Device::SessionsController
  def new
  end

  def create
    super
    
    flash[:success] = "Hey, #{current_user.first_name}"
  end
end
