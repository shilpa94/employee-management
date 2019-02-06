class AddDobToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :DOB, :date
  end
end
