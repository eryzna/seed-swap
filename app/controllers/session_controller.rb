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
        raise "EXISTING USER LOGGING IN VIA GITHUB".inspect
        session[:user_id] = user.id
        redirect_to root_path
      else
        @new_user = User.where(:email => oauth_email).create do |user|
        
          user.password = SecureRandom.hex
          
        end
        raise "new user logging in".inspect
        session[:email] = @new_user.email
        session[:password] = @new_user.password

        redirect_to root_path
        
      end
        #raise "new user logging in".inspect
        #if @new_user.save
          
          #redirect_to root_path
        #else
         # raise @new_user.errors.full_messages.inspect
        #end
      #end
    elsif  @user = User.find_by(username: params[:user][:username])
      #raise "normal user".inspect
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
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


   


