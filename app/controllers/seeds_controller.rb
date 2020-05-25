class SeedsController < ApplicationController
    def new
       # @seed = Seed.new(swap_id: params[:swap_id])
        @seed = Seed.new
    end

    def show
        @seed = Seed.find(params[:id])
    end

    
end