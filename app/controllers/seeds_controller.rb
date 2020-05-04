class SeedsController < ApplicationController
    def new
        @seed = Seed.new
    end
end