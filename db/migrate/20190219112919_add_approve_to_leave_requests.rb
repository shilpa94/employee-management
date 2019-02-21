class AddApproveToLeaveRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :leave_requests, :approve, :boolean
  end
end
