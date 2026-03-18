class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user == nil
      # No user found with this email address
      flash["notice"] = "Try again"
      redirect_to "/login"
    elsif BCrypt::Password.new(@user["password"]) != params["password"]
      # Incorrect password
      flash["notice"] = "Try again"
      redirect_to "/login"
    else
      session["user_id"] = @user["id"]
      flash["notice"] = "Welcome #{@user['first_name']}!"
      redirect_to "/posts"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "User signed out"
    redirect_to "/login"
  end
end