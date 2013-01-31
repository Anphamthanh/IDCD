class AddColumnFormToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :form, :string
  end
end
