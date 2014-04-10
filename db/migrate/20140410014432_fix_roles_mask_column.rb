class FixRolesMaskColumn < ActiveRecord::Migration
  def change
    remove_column :users, :roles_mask
    add_column :users, :roles_mask, :integer
  end
end
