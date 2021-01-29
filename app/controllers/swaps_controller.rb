class SwapsController < ApplicationController
    before_action :require_login
    
    def index
       if neighbor_swaps
           if params[:user_id]
                @user = User.find(params[:user_id])
                @swaps = @user.swaps
           elsif params[:seed_id] 
                @seed = Seed.find(params[:seed_id])
                @swap = @seed.
                @seed_swaps = @swap.collect(:users)

                #def neighbor_seed_swaps
                    #unless session[:city_id].nil? || session[:city_id].blank?
                    #@city = City.find(session[:city_id])
                    #@deal=@city.deals
                    #@store=@deal.stores
                 #end
                
                 #@deals = @city.deals
                #@stores = @deals.collect(&:stores)

                #@swaps = neighbor_swaps.select {|swap| swap.seed_id == params[:seed_id]}.flatten
                #@swaps = neighbor_swaps.select {|swap| swap.seed_id == params[:seed_id]}.flatten

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

   
    private

    def swap_params
        params.require(:swap).permit(
          :title, 
          :seed_id, 
          :user_id
        )
    end

end