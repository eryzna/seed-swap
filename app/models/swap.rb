class Swap < ActiveRecord::Base
    belongs_to :user
    belongs_to :seed

    def initial
        self[0,1]
    end
end