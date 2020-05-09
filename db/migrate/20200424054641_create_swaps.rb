class CreateSwaps < ActiveRecord::Migration[6.0]
  def change
    create_table :swaps do |t|
      t.string :title
      t.integer :user_id
      t.integer :seed_id
    end
  end
end
