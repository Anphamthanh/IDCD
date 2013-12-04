class AddColumnRequiredToProjectSchoolTable < ActiveRecord::Migration
  def change
  	add_column :project_schools, :required, :boolean, :default => false
  end
end
