class Swap < ActiveRecord::Base
    validates :title, presence: true
    belongs_to :user
    belongs_to :seed
end