class Employee < ApplicationRecord
  resourcify
  rolify
  has_many :leave_requests 
  has_many :employee_projects
  has_many :projects, through: :employee_projects

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	mount_uploader :picture, PictureUploader

	validates :firstname, :lastname, :gender, :address, :department, presence:true
	validates :email, :phone, :employee_id, presence:true, uniqueness:true
	validates :phone, length: { is: 10 },numericality: true

end
