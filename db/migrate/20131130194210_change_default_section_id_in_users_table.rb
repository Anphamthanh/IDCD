class ChangeDefaultSectionIdInUsersTable < ActiveRecord::Migration
	def up
		change_column :users, :section_id, :integer, :default => 1
		User.all.each do |u|
			if u.section_id.nil?
				u.section_id = 1
				u.save!
			end 
		end
	end

	def down
	end
end
