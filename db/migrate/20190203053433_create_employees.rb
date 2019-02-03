class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :gender
      t.integer :phone
      t.text :address
      t.string :employee_id
      t.string :department

      t.timestamps
    end
  end
end
