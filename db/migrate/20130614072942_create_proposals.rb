class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :group_id
      t.integer :project_id
      t.text :description
      t.integer :decision, :default => 0

      t.timestamps
    end
  end
end
