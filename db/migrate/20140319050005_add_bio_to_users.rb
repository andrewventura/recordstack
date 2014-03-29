class AddBioToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :bio, :string
  	add_column :users, :favoritealbum, :string
  	add_column :users, :location, :stringf
  end
end
