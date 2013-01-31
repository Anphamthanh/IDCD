class DeleteExtraColumnsFromPastProjects < ActiveRecord::Migration
  def up
    remove_column :past_projects, :title2
    remove_column :past_projects, :description2
    remove_column :past_projects, :picture2
    remove_column :past_projects, :title3
    remove_column :past_projects, :description3
    remove_column :past_projects, :picture3
    remove_column :past_projects, :title4
    remove_column :past_projects, :description4
    remove_column :past_projects, :picture4
    rename_column :past_projects, :title1, :title
    rename_column :past_projects, :description1, :description
    rename_column :past_projects, :picture1, :picture
  end

  def down
  end
end
