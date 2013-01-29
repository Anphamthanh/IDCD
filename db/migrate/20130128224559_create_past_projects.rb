class CreatePastProjects < ActiveRecord::Migration
  def change
    create_table :past_projects do |t|
      t.string :title1
      t.string :picture1
      t.text :description1
      t.string :title2
      t.string :picture2
      t.text :description2
      t.string :title3
      t.string :picture3
      t.text :description3
      t.string :title4
      t.string :picture4
      t.text :description4
      t.text :links

      t.timestamps
    end
  end
end
