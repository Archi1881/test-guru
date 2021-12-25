class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:request_url] || root_path
      cookies[:request_url] = nil
    else
      flash.now[:alert] = 'Are you Guru?  Verify your Email and Password please '
      render new
    end
  end

  def destroy
    session.destroy
    redirect_to :login
  end

end
