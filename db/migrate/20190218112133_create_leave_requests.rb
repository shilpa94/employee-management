class CreateLeaveRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :leave_requests do |t|
      t.date :start_date
      t.date :end_date
      t.integer :employee_id
      t.text :reason

      t.timestamps
    end
  end
end
