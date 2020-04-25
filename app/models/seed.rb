class Seed < ActiveRecord::Base
    has_many :swaps
    has_many :users, :through => :swaps
end