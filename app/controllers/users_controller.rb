class UsersController < ApplicationController
    before_action :require_login
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
          redirect_to swaps_path
        else
          render 'new'
        end
    end

    def omniauth_new
      @user = User.where(:email => session[:email], :password => session[:password]).new
    end

    def omniauth_create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to swaps_path
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
      @user.update_attribute(:zip_code, user_params[:zip_code])
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
          :password_confirmation, 
          :admin
        )
    end
end 