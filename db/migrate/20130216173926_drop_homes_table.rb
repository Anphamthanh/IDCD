class DropHomesTable < ActiveRecord::Migration
  def up
    drop_table :homes
  end

  def down
  end
end
