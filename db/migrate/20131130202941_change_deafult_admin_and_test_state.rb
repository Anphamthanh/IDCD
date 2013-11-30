class ChangeDeafultAdminAndTestState < ActiveRecord::Migration
  def up
		change_column :users, :admin, :boolean, :default => false
		change_column :users, :test, :boolean, :default => false
		User.all.each do |u|
			if u.test.nil?
				u.test = false
				u.save!
			end 
			if u.admin.nil?
				u.admin = false
				u.save!
			end 
		end
  end

  def down
  end
end
