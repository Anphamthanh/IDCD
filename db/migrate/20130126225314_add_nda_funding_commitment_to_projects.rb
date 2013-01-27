class AddNdaFundingCommitmentToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :nda_required, :boolean
    add_column :projects, :funding_commitment, :boolean
  end
end
