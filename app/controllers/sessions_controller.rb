class SessionsController < Device::SessionsController
  def new
  end

  def create
    super
    
    flash[:success] = t('helpers.hello', user_first_name: current_user.first_name)"
  end
end
