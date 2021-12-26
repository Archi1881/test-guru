class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:path]
        redirect_to cookies[:path]
        cookies.delete :path
      else
        redirect_to tests_path
      end
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
