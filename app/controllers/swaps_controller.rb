class SwapsController < ApplicationController

    def index
        @swaps=Swap.all
    end
    
    def new
        @swap=Swap.new
    end

    def create
        @swap=Swap.new(swap_params)
        binding.pry
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
          :seed_id
        )
    end

end