class CreateGroupProposals < ActiveRecord::Migration
  def change
    create_table :group_proposals do |t|
      t.integer :group_id
      t.integer :proposal_id

      t.timestamps
    end
  end
end
