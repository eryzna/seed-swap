class AddFacebookAttributesToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string 
    add_column :users, :email, :string
    add_column :users, :image, :string
    add_column :users, :uid, :string
  end
end