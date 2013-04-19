class AddWhatColumnToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :what, :text
  end
end
