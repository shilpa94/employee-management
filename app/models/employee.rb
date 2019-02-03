class Employee < ApplicationRecord
	validates :firstname, :lastname, :gender, :address, :department, presence:true
	validates :email, :phone, :employee_id, presence:true, uniqueness:true
	validates :phone, length: { is: 10 }
end
