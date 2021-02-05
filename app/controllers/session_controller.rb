class SessionController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  #skip_before_action :verify_authenticity_token, only: :create
  
  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if user = User.find_by(:email => oauth_email)
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        @user = User.where(:email => oauth_email).new
        @user.password = SecureRandom.hex
        session[:email] = @user.email
        session[:password] = @user.password
        render "users/omniauth_new"
        #raise "new user logging in".inspect
      end
    elsif  @user = User.find_by(username: params[:user][:username])
      #raise "normal user".inspect
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to swaps_path
      else
        redirect_to signin_path
      end
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end