class AddWhyColumnToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :why, :text
  end
end
