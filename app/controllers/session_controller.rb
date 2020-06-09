class SessionController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  #skip_before_action :verify_authenticity_token, only: :create
  
  def new
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      puts "Yes"
    
    #binding.pry
    @user = User.find_by(username: params[:user][:username])
    #binding.pry
    elsif @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end
  #def create
   # binding.pry
   # if @user = User.find_by(username: params[:user][:username])
    #  session[:user_id] = @user.id
   ## elsif auth
   #   user = User.find_or_create_by(:uid => auth['uid']) do |user|
   #     user.name = auth['info']['nickname']
   #     #user.id = auth['info']['uid']
   #     binding.pry
   #   end
   # session[:user_id] = user.id     
   # redirect_to root_url, :notice => "Signed in!"

  #  else
   #   render 'new'
  #  end
  #end

  #def create
  #  if @user = User.find_by(username: params[:user][:username])
  #    session[:user_id] = @user.id
  #    redirect_to user_path(@user)
  #  else
  #    render 'new'
   # end
 # end

  #def omniauth_create
   # user = User.find_or_create_by(:uid => auth['uid']) do |user|
      
    #  user.name = auth['info']['nickname']
      #user.id = auth['info']['uid']
    #  binding.pry
   # end
   
    #auth = request.env["omniauth.auth"]     
    #user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
   # session[:user_id] = user.id     
   ## end
 


  

  #def create
  ##  user = User.find_or_create_by(:uid => auth['uid']) do |user|
   #   user.name = auth['info']['nickname']
   #   user.id 
   # end
  ## end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end


   


