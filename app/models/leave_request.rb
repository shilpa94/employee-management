class LeaveRequest < ApplicationRecord
  belongs_to :employee
  validates  :reason, presence:true
end
