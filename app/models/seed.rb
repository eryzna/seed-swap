class Seed < ActiveRecord::Base
    has_many :swaps
    has_many :users, :through => :swaps

    def seed_category
    end
end