class DeleteSemesterIdFromCompanyTable < ActiveRecord::Migration
  def up
    remove_column :companies, :semester_id
  end

  def down
  end
end
