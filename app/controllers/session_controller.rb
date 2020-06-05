class SessionController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if @user
      @user = User.find_by(username: params[:user][:username])
      binding.pry
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    elsif auth
        @user = User.find_or_create_by(:uid => auth['uid']) do |user|
        user.name = auth['info']['name']
      end
    session[:user_id] = @user.try(:id)
    else
      render 'new'
    end
  end
  
  def omniauth_create
    #@user = User.find_or_create_by(:uid => auth['uid']) do |user|
     # user.name = auth['info']['name']
   # end
   # session[:user_id] = @user.try(:id)
    @user = User.find_or_create_by(:uid => auth['uid']) do |user|
      user.name = auth['info']['name']
    end
    session[:user_id] = @user.try(:id)
    #redirect_to '/'
    #if @user.username
   #   redirect_to user_path(@user)
    #else
    #  render 'static/signup'
   # end
   
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

