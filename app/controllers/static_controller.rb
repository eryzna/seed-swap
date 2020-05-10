class StaticController < ApplicationController

    def home
        @neighbor = neighbor
    end

end