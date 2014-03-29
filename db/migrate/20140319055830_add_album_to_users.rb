class AddAlbumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :album, :string
    add_index :users, :album
  end
end
