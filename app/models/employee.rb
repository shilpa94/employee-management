class Employee < ApplicationRecord
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	mount_uploader :picture, PictureUploader

	validates :firstname, :lastname, :gender, :address, :department, presence:true
	validates :email, :phone, :employee_id, presence:true, uniqueness:true
	validates :phone, length: { is: 10 },numericality: true

end
