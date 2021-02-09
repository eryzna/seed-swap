class SeedsController < ApplicationController
    before_action :require_login

    def index
        @seeds = Seed.all
        unless current_user.admin
            flash[:alert] = "You do not have access to that section."
            redirect_to user_path(current_user)
        end
    end

    def new
        @seed = Seed.new
       unless current_user.admin
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

    def edit
        @seed = Seed.find_by(id: params[:id])
    end
  
    def update
        @seed = Seed.find_by(id: params[:id])
        @seed.update(seed_params)
        redirect_to seed_path(@seed)
    end


    def destroy
        Seed.find(params[:id]).destroy
        redirect_to seeds_path
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