class SwapsController < ApplicationController

    def new
        @swap=Swap.new
    end
end