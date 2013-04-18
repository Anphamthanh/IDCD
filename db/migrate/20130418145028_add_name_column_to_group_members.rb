class AddNameColumnToGroupMembers < ActiveRecord::Migration
  def change
    add_column :group_members, :name, :string
  end
end
