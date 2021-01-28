class UsersController < ApplicationController
  #skip_before_action :verified_user, only: [:new, :create]
  before_action :require_login
  #before_action :require_omniauth_login, only: [:omniauth_new]
  skip_before_action :require_login, only: [:new, :create, :omniauth_new]

    def index
        @users=User.all
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render 'new'
        end
    end

    def omniauth_new
      @user = User.where(:email => session[:email], :password => session[:password]).new
      #binding.pry
      
    end

    def omniauth_create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'new'
      end
    end


    def show
      @user = User.find(params[:id])
      if @user == current_user
        render 'show'
      else
        flash[:alert] = "You do not have access to that section."
        redirect_to user_path(current_user)
      end

    end

    def edit
      @user = User.find_by(id: params[:id])
     # binding.pry
    end

    def update
      @user = User.find_by(id: params[:id])
      #binding.pry
      @user.update(user_params)
      #@user.save
      #binding.pry
      #binding.pry
      #binding.pry
      redirect_to '/swaps'
    end

    
    
    private
    
    def user_params
        params.require(:user).permit(
          :first_name, 
          :last_name,
          :zip_code,
          :username,
          :email,
          :password, 
          :password_confirmation
        )
    end
end 