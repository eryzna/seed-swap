class SwapsController < ApplicationController

    def index
        @swaps=Swap.all
    end
    
    def new
        @swap=Swap.new
    end
end