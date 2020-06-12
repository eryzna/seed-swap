class SeedsController < ApplicationController
    
    before_action :require_login

    def new
       # @seed = Seed.new(swap_id: params[:swap_id])
        @seed = Seed.new
    end

    def show
        @seed = Seed.find(params[:id])
    end

    
end