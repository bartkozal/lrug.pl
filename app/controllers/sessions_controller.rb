class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to edit_presentation_path(session[:presentation_id])
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
