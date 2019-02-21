class AddRejectToLeaveRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :leave_requests, :reject, :boolean
  end
end
