class AddOrderToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :order, :integer

    Proposal.reset_column_information

    Group.all.each do |g|
      order_index = 1
      proposals = Proposal.where("group_id = #{g.id}")
      proposals.each do |p|
        p.order = order_index
        p.save
        order_index = order_index + 1
      end
    end

  end
end

