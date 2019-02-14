class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :phone
      t.text :address
      t.string :employee_id
      t.string :department
      t.string :picture
      t.date :DOB

      t.timestamps
    end
  end
end
