class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.integer :group_id
      t.integer :student_id
      t.boolean :requested, :default => false
      t.boolean :invited, :default => false
      t.boolean :member, :default => false

      t.timestamps
    end
  end
end
