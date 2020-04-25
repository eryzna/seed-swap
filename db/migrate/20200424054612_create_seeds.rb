class CreateSeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :seeds do |t|
      t.string :name
      t.string :category
    end
  end
end
