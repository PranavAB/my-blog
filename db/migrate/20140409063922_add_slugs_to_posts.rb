class AddSlugsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :string
    
    add_index :friendly_id_slug, :slug, :unique => true
  end
end
