class AddEmailColumnToGroupMembers < ActiveRecord::Migration
  def change
    add_column :group_members, :email, :string
  end
end
