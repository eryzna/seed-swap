class SessionController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  skip_before_action :verify_authenticity_token, only: :create
  
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(username: params[:user][:username])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end


  def omniauth_create     
    user = User.find_or_create_by(:uid => auth['uid']) do |user|
      user.name = auth['info']['nickname']
      user.id = auth['info']['uid']
    end
   # binding.pry
    #auth = request.env["omniauth.auth"]     
    #user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
    session[:user_id] = user.id     
    redirect_to root_url, :notice => "Signed in!"
  end
 
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end


  

  #def create
  ##  user = User.find_or_create_by(:uid => auth['uid']) do |user|
   #   user.name = auth['info']['nickname']
   #   user.id 
   # end
  ## end
  
  def omniauth_create
    #@user = User.find_or_create_by(:uid => auth['uid']) do |user|
     # user.name = auth['info']['name']
   # end
   # session[:user_id] = @user.try(:id)
   # @user = User.find_or_create_by(:uid => auth['uid']) do |user|
    #  user.name = auth['info']['name']
   # end
   # session[:user_id] = @user.try(:id)
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

