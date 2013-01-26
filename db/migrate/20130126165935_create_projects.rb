class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :background
      t.text :concept
      t.text :design
      t.text :skills
      t.text :solutions

      t.timestamps
    end
  end
end
