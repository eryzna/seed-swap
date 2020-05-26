class SessionController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    #binding.pry
    if params[:uid]
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
      end 
      
    elsif params[:username]
      @user = User.find_by(username: params[:user][:username])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
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

