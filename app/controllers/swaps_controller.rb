class SwapsController < ApplicationController

    def index
        @swaps = Swap.all
        @neighbor = neighbor
        @neighbor.each do |t|
            if t != current_user
                @neighbor_object=t
            else
                @neighbor_object != t
            end
        end
        binding.pry
    end
    
    def new
        @swap=Swap.new
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

    private

    def swap_params
        params.require(:swap).permit(
          :title, 
          :seed_id, 
          :user_id
        )
    end

end