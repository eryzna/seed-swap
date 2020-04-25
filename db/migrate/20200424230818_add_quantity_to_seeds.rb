class AddQuantityToSeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :seeds, :quantity, :integer
  end
end
