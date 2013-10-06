class AddOrderToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :priority, :integer

    Proposal.reset_column_information

    Group.all.each do |g|
      priority_index = 1
      proposals = Proposal.where("group_id = #{g.id}")
      proposals.each do |p|
        p.priority = priority_index
        p.save
        priority_index = priority_index + 1
      end
    end

  end
end

