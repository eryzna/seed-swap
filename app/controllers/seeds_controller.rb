class SeedsController < ApplicationController
    
    before_action :require_login

    def new
        @seed = Seed.new
       if current_user.admin
        
        render 'new'
       else
        flash[:alert] = "You do not have access to that section."
        redirect_to user_path(current_user)
       end
        
    end

    def create
        @seed = Seed.new(seed_params)
        if @seed.save
          redirect_to seed_path(@seed)
        else
          render 'new'
        end
    end

    def show
        @seed = Seed.find_by(id: params[:id])
    end

    private

    def seed_params
        params.require(:seed).permit(
          :name, 
          :category, 
          :description
        )
    end

    
end