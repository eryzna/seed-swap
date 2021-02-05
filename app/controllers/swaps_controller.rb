class SwapsController < ApplicationController
    before_action :require_login
    
    def index
       if neighbor_swaps
           if params[:user_id]
                @user = User.find(params[:user_id])
                @swaps = @user.swaps
           elsif params[:seed_id] 
                #@seed = Seed.find(params[:seed_id])
                @pre_swaps = []
                if neighbor_seed_swaps != []
                    neighbor_seed_swaps.each do |t|
                        @pre_swaps << Swap.where(:id => t)
                    end
                @swaps = @pre_swaps.flatten
                else
                    flash[:alert] = "No more swaps to show!"
                end 
           else
                @swaps = neighbor_swaps
           end
        else
            puts "No Swaps to Show!"
        end
    end

    def show
        @swap = Swap.find_by(id: params[:id])
    end


    def new
        @swap=Swap.new(seed_id: params[:seed_id])
    end

    def create
        @swap=Swap.new(swap_params)
        @swap.user_id = current_user.id
        if @swap.save
            redirect_to swap_path(@swap)
        else
            render 'new'
        end
    end

    def edit
        @swap = Swap.find_by(id: params[:id])
    end
  
    def update
        @swap = Swap.find_by(id: params[:id])
        @swap.update(swap_params)
        redirect_to user_path(current_user)
    end

    def destroy
        Swap.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end
   
    private

    def swap_params
        params.require(:swap).permit(
          :title, 
          :seed_id, 
          :user_id
        )
    end

end