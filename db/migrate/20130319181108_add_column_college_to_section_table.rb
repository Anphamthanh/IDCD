class AddColumnCollegeToSectionTable < ActiveRecord::Migration
  def change
    add_column :sections, :college_id, :integer
  end
end
