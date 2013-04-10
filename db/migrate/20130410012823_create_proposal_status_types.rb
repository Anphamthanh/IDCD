class CreateProposalStatusTypes < ActiveRecord::Migration
  def change
    create_table :proposal_status_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
