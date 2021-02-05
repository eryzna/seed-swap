class Seed < ActiveRecord::Base
    validates :name, :category, :description, presence: true
    validates :name, uniqueness: true

    has_many :swaps
    has_many :users, :through => :swaps

    scope :vegetables, ->(category = 'Vegetable') { where("category == ?", category) }
    scope :fruits, ->(category = 'Fruit') { where("category == ?", category) }
    scope :herbs, ->(category = 'Herb') { where("category == ?", category) }
    scope :flowers, ->(category = 'Flower') { where("category == ?", category) }

    def self.seed_category
        @category = []
        self.all.each do |t|
            unless @category.include? t.category
                @category << t.category
            end
        end
        @category
    end

    
end