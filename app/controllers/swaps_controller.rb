class SwapsController < ApplicationController

    def index
        @neighbor_swaps = neighbor_swaps
        if params[:user_id]
            @swaps = User.find(params[:user_id]).swaps
        else
            @swaps = Swap.all
        end
    end

    def show
      @post = Post.find(params[:id])
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

    def show
        @swap = Swap.find_by(id: params[:id])
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