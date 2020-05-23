class AddDescriptionToSeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :seeds, :description, :string 
  end
end
