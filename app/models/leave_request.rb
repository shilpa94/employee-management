class LeaveRequest < ApplicationRecord
  belongs_to :employee
  validates  :start_date,:end_date, :reason, presence:true
end
