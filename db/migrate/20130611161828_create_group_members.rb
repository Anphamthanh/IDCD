class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.integer :group_id
      t.integer :student_id
      t.boolean :requested
      t.boolean :invited
      t.boolean :member

      t.timestamps
    end
  end
end
