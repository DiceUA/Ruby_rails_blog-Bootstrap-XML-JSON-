class SessionsController < ApplicationController
  def new
    # Store path we come from when pressed SignIn
    session[:prev_url] = request.referer
  end

  def create
    # Received params from form on /signin page
    current_session = params[:session]
    user = User.find_by_username(current_session[:username])
    if user && user.authenticate(current_session[:password])
      # Login. Session_Helper sign_in, need to include SessionHelper to application_controller
      sign_in user
      redirect_to session[:prev_url]
    else
      # Create error message
      flash.now[:notice] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    # SessionHelper sign_out method
    sign_out
    # Return to homepage
    redirect_to root_path
  end

end
