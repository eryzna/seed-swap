class Swap < ActiveRecord::Base
    scope :results, ->(input) { where("title LIKE ?", "%#{input}%") }
    validates :title, presence: true
    belongs_to :user
    belongs_to :seed
end