class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :mbid
      t.integer :user_id
      t.belongs_to :stack
      t.belongs_to :user

      t.timestamps
    end
    add_index :albums, [:user_id, :created_at]
  end
end
