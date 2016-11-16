class SessionsController < ApplicationController
def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to new_user_event_path(user)
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
 
end
